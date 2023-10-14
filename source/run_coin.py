import requests, sys
sys.path.insert(1, '../../TextWorldExpress')
import random
from textworld_express import TextWorldExpressEnv
from run_gpt import run_chatgpt
import argparse
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument('--model', default='gpt-4', type=str, help='OpenAI model name.')
parser.add_argument('--method', default='', required=True, type=str, help='direct|pddl')

args = parser.parse_args()

# Initialize game generator
env = TextWorldExpressEnv(envStepLimit=100)

# Set the game generator to generate a particular game (cookingworld, twc, or coin)
env.load(gameName="coin", gameParams="numLocations=3,numDistractorItems=0,includeDoors=1,limitInventorySize=0")

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
    if step_id == 1:
        print(prompt)
        raise SystemExit
    output = run_chatgpt(prompt, model=args.model, temperature=0)

    #print(output)
    def parse(output):
        return output[output.find('('):]
    #raise SystemExit
    df = open("coin_df.pddl", "r").read()
    pf = parse(output)
    prompt += [
        {"role": "assistant", "content": pf},
    ]
    data = {'domain': df,
        'problem': pf}
    resp = requests.post('http://solver.planning.domains/solve',
                        verify=False, json=data).json()
    actions = resp['result']['plan'][:-1]
    def map_actions(action):
        # (move kitchen corridor west)
        action = action.replace("(", "").replace(")", "").split(" ")
        return action[0] + " " + action[-1]
    actions = list(map(map_actions, actions))
    print(actions)
    #raise SystemExit

    taken_action = actions[0]
    return prompt, taken_action

if args.method == "direct":
    llm = llm_direct
elif args.method == "pddl":
    llm = llm_pddl

# Then, randomly generate and play 10 games within the defined parameters
steps_to_success = []
for episode_id in range(1):
    # First step
    obs, infos = env.reset(seed=episode_id, gameFold="train", generateGoldPath=True)
    print("Gold path: " + str(env.getGoldActionSequence()))
    # Display the observations from the environment.
    brief_obs = obs.split('\n')[0].split(". ")[0] + ". " + obs.split('\n')[1]
    print(brief_obs)
    past_prompt = []
    for step_id in range(0, 10):
        # If there is a coin, just take it
        if " coin" in obs:
            taken_action = "take coin"
        else:
            # Select a valid action
            valid_actions = sorted(infos['validActions'])
            valid_actions.remove('look around')
            valid_actions.remove('inventory')
            print(valid_actions)
            #break
            past_prompt, taken_action = llm(past_prompt, brief_obs, valid_actions)

        # Take that action
        obs, reward, done, infos = env.step(taken_action)

        # Display action and the game's feedback.
        print(">", taken_action)
        print(obs)
        if done:
            steps_to_success.append(step_id)
            break
    else:
        steps_to_success.append(-1)
print(steps_to_success)