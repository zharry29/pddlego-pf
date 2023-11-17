import requests, sys
import random
random.seed(29)
from run_gpt import run_chatgpt
import argparse
from pathlib import Path
import pickle
import backoff
import json
from run_pddl_solver import run_solver

def extract_pddl(resp):
    # Extract lines between ```
    lines = resp.split("\n")
    pddl = []
    begin = False
    for line in lines:
        if line.startswith("```"):
            begin = not begin
            if pddl:
                yield '\n'.join(pddl)
                pddl = []
        elif begin:
            pddl.append(line)
    if pddl:
        yield '\n'.join(pddl)


def run_gpt():
    prompt = [
        {"role": "user", "content": open("cooking_df_gen_prompt.txt", 'r').read()},
    ]
    resp = ""
    while resp == "" or resp["status"] == "error":
        output = run_chatgpt(prompt, model="gpt-4-1106-preview", temperature=1)
        prompt.append({"role": "assistant", "content": output})
        df, pf = extract_pddl(output)
        with open("out_df.pddl", "w") as f:
            f.write(df)
        with open("out_pf.pddl", "w") as f:
            f.write(pf)
        print("===DF===")
        print(df)
        print("===PF===")
        print(pf)
        resp = run_solver(df, pf)
        print("===RESP===")
        print(resp)
        if resp["status"] == "error":
            error = resp["result"]["error"]
            feedback = ""
            if "syntax error" in error:
                line_num = int(error.split("syntax error in line ")[-1].split(",")[0])
                error_line = df.split("\n")[line_num - 1]
                feedback = "There is a syntax error in line " + str(line_num) + ": " + error_line + "\n"
            else:
                feedback = error
            print("===FEEDBACK===")
            print(feedback)
            prompt.append({"role": "User", "content": feedback + "Please fix the syntax error and try again. Be sure to output the complete domain and problem files."})
    print(resp)    
    print([x ["name"] for x in resp['result']['plan']])
        


run_gpt()