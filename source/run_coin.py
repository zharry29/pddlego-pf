import requests, sys
sys.path.insert(1, '../../TextWorldExpress')
import random
from textworld_express import TextWorldExpressEnv
from run_gpt import run_chatgpt
import argparse
from pathlib import Path
import pickle
import backoff

parser = argparse.ArgumentParser()
parser.add_argument('--model', default='gpt-4', type=str, help='OpenAI model name.')
parser.add_argument('--method', default='', required=True, type=str, help='direct|pddl')

args = parser.parse_args()

# Initialize game generator
env = TextWorldExpressEnv(envStepLimit=100)

# Set the game generator to generate a particular game (cookingworld, twc, or coin)
NUM_LOCATIONS = 5
env.load(gameName="coin", gameParams=f"numLocations={NUM_LOCATIONS},numDistractorItems=0,includeDoors=1,limitInventorySize=0")

@backoff.on_exception(backoff.expo, (ConnectionResetError))
def post_pddl(data):
    return requests.post('http://solver.planning.domains/solve',
                        verify=False, json=data).json()


def llm_direct(past_prompt, obs, valid_actions):
    if not past_prompt:
        prompt = [
            {"role": "user", "content": "You will play a game where your goal is to collect a coin. I will provide you with a description of the environment, and you will take one of the valid actions. Ready?"},
            {"role": "assistant", "content": "Absolutely, I'm ready! Please describe the environment."},
        ]
    prompt = past_prompt + [
        {"role": "user", "content": obs + "\n\n" + "Your valid actions are: " + str(valid_actions) + "\n\n" + "Which action do you take?"},
    ]
    output = run_chatgpt(prompt, model=args.model, temperature=0)
    taken_action = ""
    for valid_action in valid_actions:
        if valid_action in output:
            taken_action = valid_action
            break
    prompt += [
        {"role": "assistant", "content": taken_action},
    ]
    return prompt, taken_action

def llm_pddl(past_prompt, obs, valid_actions):
    if not past_prompt:
        prompt = [
            {"role": "user", "content": open("coin_prompt.txt", "r").read() + obs + "\n\n" + "Your task is to go to a location you have not been yet. Generate a problem file."},
        ]
    else:
        prompt = past_prompt + [
            {"role": "user", "content": obs + "\n\n" + "Your task is to go to a location you have not been yet. Generate a problem file."},
        ]
    #print(prompt)
    try:
        cache = pickle.load(open("cache.pkl", "rb"))
    except FileNotFoundError:
        pickle.dump({}, open("cache.pkl", "wb"))
        cache = pickle.load(open("cache.pkl", "rb"))
    try:
        output = cache[(NUM_LOCATIONS, episode_id, step_id)]
    except KeyError:
        output = run_chatgpt(prompt, model=args.model, temperature=0)
        cache[(NUM_LOCATIONS, episode_id, step_id)] = output
        pickle.dump(cache, open("cache.pkl", "wb"))

    #print(output)
    def parse(output):
        return output[output.find('('):].split("```")[0].strip()
    #raise SystemExit
    df = open("coin_df.pddl", "r").read()
    pf = parse(output)
    print(pf)
    prompt += [
        {"role": "assistant", "content": pf},
    ]
    data = {'domain': df,
        'problem': pf}
    resp = post_pddl(data)
    #print(resp)
    actions = resp['result']['plan']
    #print(actions)
    if isinstance(actions[0], str):
        actions.remove('(reach-goal)')
    elif isinstance(actions[0], dict):
        actions = [x['name'] for x in actions]
    def map_actions(action):
        # move action
        # (move kitchen corridor west)
        if "(move " in action:
            action = action.replace("(", "").replace(")", "").split(" ")
            action = action[0] + " " + action[-1]
        # open door action
        # open_door l1
        elif "(open_door " in action:
            at_location = ""
            direction = ""
            for line in pf.split("\n"):
                if "(at " in line:
                    at_location = line.split("(at ")[1].split(")")[0]
                if "(connected" in line:
                    loc_source = line.split("(connected ")[1].split(" ")[0]
                    loc_target = line.split("(connected ")[1].split(" ")[1]
                    if loc_source == at_location:
                        direction = line.split("(connected ")[1].split(" ")[2].split(")")[0]
                        break
            action = "open door to " + direction
        return action
    #print(actions)
    actions = list(map(map_actions, actions))
    #print(actions)
    #raise SystemExit

    #taken_action = actions[0]
    return prompt, actions

if args.method == "direct":
    llm = llm_direct
elif args.method == "pddl":
    llm = llm_pddl

# Then, randomly generate and play 10 games within the defined parameters
steps_to_success = []
for episode_id in range(3,4):
    # First step
    obs, infos = env.reset(seed=episode_id, gameFold="train", generateGoldPath=True)
    print("Gold path: " + str(env.getGoldActionSequence()))
    # Display the observations from the environment.
    def summarize_obs(obs):
        # If obs only has one line, return it
        if len(obs.split('\n')) == 1:
            return obs
        # Only keep where you are and location informtion
        else:
            return obs.split('\n')[0].split(". ")[0] + ". " + obs.split('\n')[1]
    brief_obs = summarize_obs(obs)
    print(brief_obs)
    past_prompt = []
    action_queue = []
    obs_queue = []
    for step_id in range(0, 10):
        print("Step " + str(step_id))
        # If there is a coin, just take it
        if " coin" in obs:
            taken_action = "take coin"
        else:
            # Select a valid action
            valid_actions = sorted(infos['validActions'])
            valid_actions.remove('look around')
            valid_actions.remove('inventory')
            # Check action queue for remaining actions
            if not action_queue:
                if obs_queue:
                    brief_obs = "\n".join(obs_queue)
                    obs_queue = []
                past_prompt, actions = llm(past_prompt, brief_obs, valid_actions)
                action_queue += actions
            taken_action = action_queue.pop(0)

        # Take that action
        obs, reward, done, infos = env.step(taken_action)
        brief_obs = summarize_obs(obs)
        obs_queue.append(brief_obs)

        # Display action and the game's feedback.
        print(">", taken_action)
        print(brief_obs)
        if done:
            steps_to_success.append(step_id)
            break
    else:
        steps_to_success.append(-1)
print(steps_to_success)