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
parser.add_argument('--model', default='gpt-4', type=str, help='OpenAI model name.')
parser.add_argument('--method', default='', required=True, type=str, help='direct|pddl')
parser.add_argument('--det', action='store_true', help='Whether to deterministically edit the problem file. Assumes method is pddl.')
parser.add_argument('--oc', action='store_true', help='Whether to overwrite the cache.')

args = parser.parse_args()

# Initialize game generator
env = TextWorldExpressEnv(envStepLimit=100)

# Set the game generator to generate a particular game (cookingworld, twc, or coin)
NUM_LOCATIONS = 1
NUM_INGREDIENTS = 1
MAX_STEPS = 10
env.load(gameName="cookingworld", gameParams=f"numLocations={NUM_LOCATIONS},numIngredients={NUM_INGREDIENTS},numDistractorItems=0,includeDoors=1,limitInventorySize=0")

def llm_direct(past_prompt, obs, valid_actions):
    if not past_prompt:
        past_prompt = [
            {"role": "user", "content": "You will play a game where your goal is to read a recipe, find ingredents, cook a meal, and eat the meal. I will provide you with a description of the environment, and you will take one of the valid actions. Ready?"},
            {"role": "assistant", "content": "Absolutely, I'm ready! Please describe the environment."},
        ]
    prompt = past_prompt + [
        {"role": "user", "content": obs + "\n\n" + "Your valid actions are: " + str(valid_actions) + "\n\n" + "Which action do you take?"},
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


# Then, randomly generate and play 10 games within the defined parameters
steps_to_success = []
for episode_id in range(0,10):
#for episode_id in [0]:
    # First step
    obs, infos = env.reset(seed=episode_id, gameFold="train", generateGoldPath=True)
    print("Gold path: " + str(env.getGoldActionSequence()))
    # Display the observations from the environment.
    # def summarize_obs(obs):
    brief_obs = "Action: look around\n" + obs
    print(brief_obs)
    past_prompt = []
    action_queue = []
    obs_queue = []
    if args.det:
        prev_pf = open("coin_init_pf.pddl", "r").read()
    for step_id in range(0, MAX_STEPS):
        print("Step " + str(step_id))
        # Select a valid action
        valid_actions = sorted(infos['validActions'])
        valid_actions.remove('look around')
        valid_actions.remove('inventory')
        print("Valid actions: " + str(valid_actions))
        #raise SystemExit
        if step_id == 0:
            taken_action = "examine cookbook"
        elif args.method == "random":
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
                    if args.det:
                        past_prompt, actions, prev_pf = llm_pddl(past_prompt, brief_obs, valid_actions, prev_pf)
                    else:
                        try:
                            past_prompt, actions, _ = llm_pddl(past_prompt, brief_obs, valid_actions)
                        except:
                            steps_to_success.append(-1)
                            break
                action_queue += actions
            if action_queue:
                taken_action = action_queue.pop(0)
                # if planned action is invalid, execute a random action
                if taken_action not in valid_actions:
                    #raise ValueError("Invalid action")
                    steps_to_success.append(-1)
                    break
                    print("Invalid action: " + taken_action, ". Taking random action")
                    taken_action = random.choice(valid_actions)
            # if no plan can be found, execute a random action
            else:
                #raise ValueError("No plan is found")
                steps_to_success.append(-1)
                break
                print("No plan is found. ", "Taking random action")
                taken_action = random.choice(valid_actions)

        # Take that action
        obs, reward, done, infos = env.step(taken_action)
        brief_obs = "Action: " + taken_action + "\n" + obs
        obs_queue.append(brief_obs)

        # Display action and the game's feedback.
        print(">", taken_action)
        print(brief_obs)
        if done:
            if infos["tasksuccess"]:
                steps_to_success.append(step_id)
            else:
                steps_to_success.append(-1)
            break
    else:
        steps_to_success.append(-1)
print(steps_to_success)