import os
import openai
from run_gpt import run_chatgpt
import argparse
from pathlib import Path
import json

parser = argparse.ArgumentParser()
parser.add_argument('--key', default='harry_ccbft', type=str, help='The name of the OpenAI API key file.')
parser.add_argument('--model', default='gpt-4', required=False, type=str, help='OpenAI model name.')

args = parser.parse_args()
openai.api_key = open(f'../../_private/{args.key}.key').read()

def parse_output(output):
    df = ""
    pf = ""
    df_flag = False
    pf_flag = False
    for line in output.split('\n'):
        if line.startswith('(define (domain'):
            df_flag = True
        if line.startswith('(define (problem'):
            pf_flag = True
        if df_flag:
            df += line + '\n'
        if pf_flag:
            pf += line + '\n'
        if line.startswith(')'):
            df_flag = False
            pf_flag = False
    return df, pf



dt = "You are a robot operating in a household, which contains the following locations: counter, table, user, trash, bowl, and initial. You will work with a series of food and drinks, including apple, orange, kettle chips, multigrain chips, jalapeno chips, rice chips, energy bar, seven-up, coke, lime soda, grapefruit soda, pepsi, tea, redbull, and water. They taste different. There is also a sponge. You can only perform 4 actions: find, go, pick, and put."

with open("../datasets/saycan/test.jsonl") as f:
    data = [json.loads(line) for line in f]
    for example in data:
        id = example["id"]
        pt = "Your task is: " + example["question"]
        instruction = "Generate a PDDL domain file and a PDDL problem file for the task. Again, you can only perform 4 actions: find, go, pick, and put."
        prompt = [
            {"role": "user", "content": dt + '\n' + pt + '\n' + instruction}
        ]
        output = run_chatgpt(prompt, model=args.model, temperature=0)
        print(output)
        df, pf = parse_output(output)
        with open(f"../datasets/saycan/output/{id}_raw_output.txt", "w") as f:
            f.write(output)
        with open(f"../datasets/saycan/output/{id}_df.pddl", "w") as f:
            f.write(df)
        with open(f"../datasets/saycan/output/{id}_pf.pddl", "w") as f:
            f.write(pf)
        #break