import requests, sys
import random
random.seed(29)
from textworld_express import TextWorldExpressEnv
from run_gpt import run_chatgpt
import argparse
from pathlib import Path
import pickle
import backoff
import json
from fix_json import fix_json

parser = argparse.ArgumentParser()
parser.add_argument('--model', default='gpt-4-1106-preview', type=str, help='OpenAI model name.')
parser.add_argument('--method', default='', required=True, type=str, help='direct|pddl')
parser.add_argument('--ep', default=-1, required=False, type=int, help='If specified, only run on that episode ID.')
parser.add_argument('--det', action='store_true', help='Whether to deterministically edit the problem file. Assumes method is pddl.')
parser.add_argument('--oc', action='store_true', help='Whether to overwrite the cache.')

args = parser.parse_args()

# Initialize game generator
env = TextWorldExpressEnv(envStepLimit=100)

# Set the game generator to generate a particular game (cookingworld, twc, or coin)
NUM_LOCATIONS = 2
NUM_INGREDIENTS = 2
MAX_STEPS = 20
env.load(gameName="cookingworld", gameParams=f"numLocations={NUM_LOCATIONS},numIngredients={NUM_INGREDIENTS},numDistractorItems=0,includeDoors=1,limitInventorySize=0")

@backoff.on_exception(backoff.expo, (ConnectionResetError, requests.exceptions.ConnectionError, requests.exceptions.ReadTimeout))
def post_pddl(data):
    resp = requests.post('http://solver.planning.domains/solve',
                        verify=False, json=data, timeout=5).json()
    return resp

def llm_direct(past_prompt, obs, valid_actions):
    if not past_prompt:
        past_prompt = [
            {"role": "user", "content": "You will play a game where your goal is to read a recipe, find ingredents, cook a meal, and eat the meal. I will provide you with a description of the environment, and you will take one of the valid actions. Ready?"},
            {"role": "assistant", "content": "Absolutely, I'm ready! Please describe the environment."},
        ]
    prompt = past_prompt + [
        {"role": "user", "content": obs + "\n\n" + "Your valid actions are: " + str(valid_actions) + "\n\n" + "Which action do you take? Output the action only and nothing else."},
    ]
    print("===")
    print(prompt)
    print("===")
    output = run_chatgpt(prompt, model=args.model, temperature=0)
    taken_action = ""
    for valid_action in valid_actions:
        if valid_action in output:
            taken_action = valid_action
            break
    prompt += [
        {"role": "assistant", "content": taken_action},
    ]
    return prompt, [taken_action]


def run_pddl_solver(df,pf):
    data = {'domain': df,
        'problem': pf}
    resp = post_pddl(data)
    if resp["status"] == "error":
        return []
    actions = resp['result']['plan']
    if isinstance(actions[0], str):
        actions.remove('(reach-goal)')
    elif isinstance(actions[0], dict):
        actions = [x['name'] for x in actions]
    return actions

def space_to_underscore(s):
    return s.replace(" ", "_")

def underscore_to_space(s):
    return s.replace("_", " ")

def map_actions_find(action, pf):
    # move action
    # (move kitchen corridor west)
    if "(move " in action:
        action = action.replace("(", "").replace(")", "").split(" ")
        action = action[0] + " " + action[-1]
    # open door action
    # open_door l1
    elif "(open_door " in action:
        _, source, target = action.replace("(", "").replace(")", "").split(" ")
        direction = ""
        for line in pf.split("\n"):
            if "(connected" in line:
                loc_source = line.split("(connected ")[1].split(" ")[0]
                loc_target = line.split("(connected ")[1].split(" ")[1]
                if loc_source == source and loc_target == target:
                    direction = line.split("(connected ")[1].split(" ")[2].split(")")[0]
                    break
        action = "open door to " + direction
    return action
    
def map_actions_cook(action):
    action = action.replace("(", "").replace(")", "")
    if "use_toaster" in action:
        action = "cook " + underscore_to_space(action.split(" ")[1]) + " in toaster"
    elif "use_oven" in action:
        action = "cook " + underscore_to_space(action.split(" ")[1]) + " in oven"
    elif "use_stove" in action:
        action = "cook " + underscore_to_space(action.split(" ")[1]) + " in stove"
    else:
        action = action.split(" ")[0] + " " + underscore_to_space(action.split(" ")[1])

    return action

def llm_pddl_cook(prev_pf, required_ingredients, required_tools, all_location_items, ingredient_states):
    #new_wording = "You will modify the above problem file using add, delate, and replace operations (in a JSON format). You SHOULD NOT provide a problem file directly."
    pf_lines = prev_pf.split("\n")
    out_lines = []
    for line in pf_lines:
        out_lines.append(line)
        if "(:objects" in line:
            for ingredient in required_ingredients:
                out_lines.append("    " + space_to_underscore(ingredient) + " - ingredient")
            for tool in required_tools:
                out_lines.append("    " + space_to_underscore(tool) + f" - {tool}")
        elif "(:init" in line:
            for ingredient in required_ingredients:
                out_lines.append("    (have " + space_to_underscore(ingredient) + ")")
            if "knife" in required_tools:
                out_lines.append("    (have knife)")
            for tool in required_tools:
                for location, items in all_location_items.items():
                    if tool in items:
                        out_lines.append("    (obj_at " + space_to_underscore(tool) + " " + space_to_underscore(location) + ")")
                        break
        elif "(:goal" in line:
            out_lines.append("    (and")
            for state, ingredient in ingredient_states:
                out_lines.append("        (" + state + " " + space_to_underscore(ingredient) + ")")
            out_lines.append("    )")
            out_lines.append("  )")
            out_lines.append(")")
            break
    pf = "\n".join(out_lines)
    #print(pf)
    df = open("cooking_df.pddl", "r").read()
    actions = run_pddl_solver(df, pf)
    #print(actions)
    
    actions = list(map(map_actions_cook, actions))

    return actions

def llm_pddl_find(past_prompt, obs, prev_pf=""):
    def apply_edit(prev_pf, edit_json):
        output = []
        o_start = False
        i_start = False
        # Manually cascade location replace
        loc_replace = {}
        for s,t in edit_json["objects"]["replace"].items():
            if s.endswith(" - location") and t.endswith(" - location"):
                loc_replace[s[:-len(" - location")]] = t[:-len(" - location")]
        for line in prev_pf.split("\n"):
            if "(:object" in line:
                o_start = True
                output.append(line)
            elif o_start and line.strip() == ")":
                o_start = False
                for to_add in edit_json["objects"]["add"]:
                    output.append("    " + to_add)
                output.append(line)
            elif o_start:
                if line.strip() in edit_json["objects"]["replace"]:
                    line = edit_json["objects"]["replace"][line.strip()]
                    output.append("    " + line)
                elif line.strip() in edit_json["objects"]["delete"]:
                    continue
                else:
                    output.append(line)
            elif "(:init" in line:
                i_start = True
                output.append(line)
            elif i_start and line.strip() == ")":
                i_start = False
                for to_add in edit_json["init"]["add"]:
                    output.append("    " + to_add)
                output.append(line)
            elif i_start:
                if line.strip() in edit_json["init"]["replace"]:
                    line = edit_json["init"]["replace"][line.strip()]
                    output.append("    " + line)
                elif line.strip() in edit_json["init"]["delete"]:
                    continue
                else:
                    output.append(line)
            else:
                output.append(line)
        
        output_str = "\n".join(output)
        # Manually cascade location replace using a crude replace
        for s, t in loc_replace.items():
            output_str = output_str.replace(s, t)
        
        return output_str

    prompt_file = "coin_det_prompt.txt"
    new_wording = "You will modify the above problem file using add, delate, and replace operations (in a JSON format). You SHOULD NOT provide a problem file directly."
    if not past_prompt:
        prompt = [
            {"role": "user", "content": open(prompt_file, "r").read() + obs + "\n\n" + new_wording},
        ]
    else:
        prompt = []
        for i, message in enumerate(past_prompt):
            # remove previous display of PF
            if i < len(past_prompt) - 2 and message["content"].startswith("After your previous edits"):
                continue
            if i < len(past_prompt) - 2 and message["content"] == "OK, I will base my edit on this problem file.":
                continue
            prompt.append(message)
        prompt += [
            {"role": "user", "content": obs + "\n\n" + new_wording},
        ]
    #print(prompt)
    #raise SystemExit()
    cache_name = "cache_cooking.pkl"
    try:
        cache = pickle.load(open(cache_name, "rb"))
    except FileNotFoundError:
        pickle.dump({}, open(cache_name, "wb"))
        cache = pickle.load(open(cache_name, "rb"))
    try:
        if not args.oc:
            output = cache[(NUM_LOCATIONS, NUM_INGREDIENTS, episode_id, step_id)]
        else:
            raise KeyError
    except KeyError:
        output = run_chatgpt(prompt, model=args.model, temperature=0)
        cache[(NUM_LOCATIONS, NUM_INGREDIENTS, episode_id, step_id)] = output
        pickle.dump(cache, open(cache_name, "wb"))

    #print(output)
    #raise SystemExit
    df = open("coin_df.pddl", "r").read()
    #print(output)
    try:
        out_json = json.loads(output)
    except json.decoder.JSONDecodeError:
        out_json = json.loads(fix_json(output))
    pf = apply_edit(prev_pf, out_json)
    prev_pf = pf
    #print(pf)
    #raise SystemExit
    if not args.det:
        prompt += [
            {"role": "assistant", "content": pf},
        ]
    else:
        prompt += [
            {"role": "assistant", "content": output},
            {"role": "user", "content": "After your previous edits, the current problem file is:\n\n" + pf + "\n\n" + "Please make more edits based on this problem file."},
            {"role": "assistant", "content": "OK, I will base my edit on this problem file."},
        ]

    actions = run_pddl_solver(df, pf)

    #print(actions)
    actions = [map_actions_find(a, pf) for a in actions]
    #print(actions)
    #raise SystemExit

    #taken_action = actions[0]
    return prompt, actions, prev_pf

def parse_recipe(recipe):
    ingredient_start = False
    directions_start = False
    ingredients = []
    tools = []
    ingredient_states = []
    action_to_tool = {
        "grill": "toaster",
        "roast": "oven",
        "fry": "stove",
        "slice": "knife",
        "chop": "knife",
        "dice": "knife",
    }
    action_to_state = {
        "grill": "grilled",
        "roast": "roasted",
        "fry": "fried",
        "slice": "sliced",
        "chop": "chopped",
        "dice": "diced",
    }
    for line in recipe.split('\n'):
        if line.startswith("Ingredients:"):
            ingredient_start = True
            continue
        if line.startswith("Directions:"):
            ingredient_start = False
            directions_start = True
            continue
        if "prepare meal" in line:
            directions_start = False
            break
        if ingredient_start and line.strip():
            ingredients.append(line.strip())
        if directions_start:
            direction = line.strip()
            action = direction.split(" the ")[0]
            required_tool = action_to_tool[action]
            ingredient = direction.split(" the ")[1]
            assert ingredient in ingredients
            tools.append(required_tool)
            ingredient_states.append((action_to_state[action], ingredient))
    # Remove duplicates from tools
    tools = list(set(tools))
    return ingredients, tools, ingredient_states

def get_location_items(obs):
    prompt_file = "cooking_location_prompt.txt"
    new_wording = "You should output a JSON with one key as the location. Only output the JSON; do not output anything else."
    prompt = [
        {"role": "user", "content": open(prompt_file, "r").read() + obs + "\n\n" + new_wording},
    ]
    output = run_chatgpt(prompt, model=args.model, temperature=0, force_json=True)
    #print(output)
    return json.loads(output)

def get_container_items(obs):
    prompt_file = "cooking_container_prompt.txt"
    new_wording = "You should output a JSON with one key as the container. Only output the JSON; do not output anything else."
    prompt = [
        {"role": "user", "content": open(prompt_file, "r").read() + obs + "\n\n" + new_wording},
    ]
    output = run_chatgpt(prompt, model=args.model, force_json=True, temperature=0)
    return json.loads(output)

def move_to_kitchen(pf):
    goal_block = """  (:goal 
    (exists (?x - location)
        (and
            (not (visited ?x))
            (at ?x)
        )
    )
  )"""
    new_goal_block = """  (:goal 
    (at kitchen)
  )"""
    new_pf = pf.replace(goal_block, new_goal_block)
    
    df = open("coin_df.pddl", "r").read()
    actions = run_pddl_solver(df, new_pf)
    actions = [map_actions_find(a, pf) for a in actions]
    return actions

def process_item_name(item):
    if item.startswith("raw "):
        item = item.split("raw ")[1]
    if item.startswith("some "):
        item = item.split("some ")[1]
    return item

# Then, randomly generate and play 10 games within the defined parameters
steps_to_success = []
if args.ep != -1:
    episode_ids = [args.ep]
else:
    episode_ids = range(0,10)
for episode_id in episode_ids:
    # First step
    obs, infos = env.reset(seed=episode_id, gameFold="train", generateGoldPath=True)
    #print("Gold path: " + str(env.getGoldActionSequence()))
    
    # Step 0 is always examining the cookbok
    recipe, _, _, _ = env.step("examine cookbook")
    print("< examine cookbook")
    print("> " + recipe)
    required_ingredients, required_tools, ingredient_states = parse_recipe(recipe)
    #print(ingredient_states)
    #raise SystemExit()
    unlocated_ingredients = required_ingredients.copy()
    unlocated_tools = required_tools.copy()
    #print("Ingredients: " + str(unlocated_ingredients))
    #print("Tools: " + str(unlocated_tools))

    # Display the observations from the environment.
    def summarize_obs(obs):
        # If obs only has one line, return it
        if len(obs.split('\n')) == 1:
            return obs
        # Only keep where you are and location informtion
        else:
            return obs.split('\n')[0].split(". ")[0] + ". " + obs.split('\n')[1]
    brief_obs = "\nAction: look around\n" + summarize_obs(obs)
    init_obs = "Action: examine cookbook\n" + recipe + "\nAction: look around\n" + obs
    print("< look around")
    print("> " + obs)
    past_prompt = []
    action_queue = []
    obs_queue = []
    prev_pf = ""
    all_location_items = {}
    step_id = 1
         
    while True:
        if step_id >= MAX_STEPS:
            steps_to_success.append(-1)
            break
        #print("Step " + str(step_id))

        # Enter new room
        if args.method == "pddl" and obs.startswith("You are in "):
            obs = obs.split("\n")[0] # remove info about doors
            location_items = get_location_items(obs)
            location_name = list(location_items.keys())[0]
            for i, item in enumerate(list(location_items.values())[0]):
                if item.endswith(" (closed)"):
                    item = item.replace(" (closed)", "")
                    location_items[location_name][i] = item
                    open_obs, _, _, _ = env.step("open " + item)
                    step_id += 1
                    print("< open " + item)
                    print("> " + open_obs)
                    if "empty" in open_obs:
                        continue
                    container_items = get_container_items(open_obs)
                    #print(container_items)
                    #raise SystemExit()
                    for j, takeable in enumerate(list(container_items.values())[0]):
                        takeable = process_item_name(takeable)
                        if takeable == "knife": 
                            unlocated_tools.remove(takeable)
                            take_obs, _, _, _ = env.step("take " + takeable)
                            step_id += 1
                            print("< take " + takeable)
                            print("> " + take_obs)
                        elif takeable in unlocated_ingredients: 
                            unlocated_ingredients.remove(takeable)
                            take_obs, _, _, _ = env.step("take " + takeable)
                            step_id += 1
                            print("< take " + takeable)
                            print("> " + take_obs)
                if item in unlocated_tools: 
                    unlocated_tools.remove(item)
                    if item == "knife":
                        take_obs, _, _, _ = env.step("take " + item)
                        step_id += 1
                        print("< take " + item)
                        print("> " + take_obs)
                if item in unlocated_ingredients: 
                    unlocated_ingredients.remove(item)
                    take_obs, _, _, _ = env.step("take " + item)
                    step_id += 1
                    print("< take " + item)
                    print("> " + take_obs)
            all_location_items.update(location_items)

        #print(all_location_items)
        #raise SystemExit()

        #print("Unlocated: Ingredients: " + str(unlocated_ingredients))
        #print("Unlocated: Tools: " + str(unlocated_tools))
        #raise SystemExit()
        

        # Select a valid action
        valid_actions = sorted(infos['validActions'])
        valid_actions = [a for a in valid_actions if not a.startswith("close ") and not a.startswith("examine ") and not a.endswith(" cookbook") and a not in ["look around", "wait", "inventory"]]
        #print("Valid actions: " + str(valid_actions))

        if args.method == "random":
            taken_action = random.choice(valid_actions)
        else:
            # Check action queue for remaining actions
            if not action_queue:
                if obs_queue:
                    brief_obs = "\n".join(obs_queue)
                    obs_queue = []
                if args.method == "direct":
                    past_prompt, actions = llm_direct(past_prompt, brief_obs, valid_actions)
                elif args.method == "pddl":
                    if not prev_pf:
                        prev_pf = open("coin_init_pf.pddl", "r").read()
                    past_prompt, actions, prev_pf = llm_pddl_find(past_prompt, brief_obs, prev_pf)
                    # If there are still uncollected ingredients or unlocated tools
                    if not (unlocated_ingredients or unlocated_tools):
                        # Cook
                        actions = llm_pddl_cook(prev_pf, required_ingredients, required_tools, all_location_items, ingredient_states)
                        #print(actions)
                        # Check if in kitchen
                        if "(at kitchen)" not in prev_pf:
                            # Move to kitchen
                            actions = move_to_kitchen(prev_pf) + actions
                            #print(actions)
                        actions += ["prepare meal", "eat meal"]
                        #raise SystemExit()
                action_queue += actions
            
            taken_action = action_queue.pop(0)
            # if planned action is invalid, execute a random action
            # TODO: there's a bug that only considers the previous valid_actions
            #if taken_action not in valid_actions:
            #    raise ValueError("Invalid action")
                #steps_to_success.append(-1)
                #break
                #print("Invalid action: " + taken_action, ". Taking random action")
                #taken_action = random.choice(valid_actions)

        # Take that action
        obs, reward, done, infos = env.step(taken_action)
        step_id += 1
        brief_obs = "Action: " + taken_action + "\n" + obs
        obs_queue.append(brief_obs)

        # Display action and the game's feedback.
        print(">", taken_action)
        #print(brief_obs)
        if done:
            if infos["tasksuccess"]:
                steps_to_success.append(step_id)
            else:
                steps_to_success.append(-1)
            break
        #_ = input("Continue?")
#print(steps_to_success)