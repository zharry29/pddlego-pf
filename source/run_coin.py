import sys
sys.path.insert(1, '../../TextWorldExpress')
import random
from textworld_express import TextWorldExpressEnv
from run_gpt import run_chatgpt

# Initialize game generator
env = TextWorldExpressEnv(envStepLimit=100)

# Set the game generator to generate a particular game (cookingworld, twc, or coin)
env.load(gameName="coin", gameParams="numLocations=3,numDistractorItems=3,includeDoors=1,limitInventorySize=0")

def llm_direct(past_prompt, obs, validActions):
    if not past_prompt:
        prompt = [
            {"role": "user", "content": "You will play a game where your goal is to collect a coin. I will provide you with a description of the environment, and you will take one of the valid actions. Ready?"},
            {"role": "assistant", "content": "Absolutely, I'm ready! Please describe the environment."},
        ]
    prompt = past_prompt + [
        {"role": "user", "content": obs + "\n\n" + "Your valid actions are: " + str(validActions) + "\n\n" + "Which action do you take?"},
    ]
    output = run_chatgpt(prompt, model="gpt-3.5-turbo", temperature=0)
    taken_action = ""
    for valid_action in validActions:
        if valid_action in output:
            taken_action = valid_action
            break
    prompt += [
        {"role": "assistant", "content": taken_action},
    ]
    return prompt, taken_action

def llm_pddl(past_prompt, obs, validActions):
    pass

# Then, randomly generate and play 10 games within the defined parameters
steps_to_success = []
for episode_id in range(5):
    # First step
    obs, infos = env.reset(seed=episode_id, gameFold="train", generateGoldPath=True)
    print("Gold path: " + str(env.getGoldActionSequence()))

    # Display the observations from the environment.
    print(obs)
    past_prompt = []
    for step_id in range(0, 10):
        # Select a random valid action
        validActions = sorted(infos['validActions'])
        print(validActions)
        #break
        past_prompt, taken_action = llm_direct(past_prompt, obs, validActions)

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