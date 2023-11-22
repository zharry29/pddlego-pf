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

parser = argparse.ArgumentParser()
parser.add_argument('--task', default='cooking', type=str)
parser.add_argument('--refine', action='store_true')
parser.add_argument('--manual', action='store_true')
parser.add_argument('--det', action='store_true')

args = parser.parse_args()

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

if args.task == "cooking":
    prompt_fname = "cooking_df_gen_prompt.txt"
elif args.task == "coin":
    prompt_fname = "coin_df_gen_prompt.txt"

def run_gpt():
    prompt = [
        {"role": "user", "content": open(prompt_fname, 'r').read()},
    ]
    resp = ""
    iterations = 0
    prev_error = ""
    while resp == "" or resp["status"] == "error":
        iterations += 1
        if iterations > 10:
            print("Too many iterations, exiting")
            break
        if resp != "" and args.det:
            force_json = True
        else:
            force_json = False
        output = run_chatgpt(prompt, model="gpt-4-1106-preview", temperature=1, force_json=force_json)
        prompt.append({"role": "assistant", "content": output})
        if not force_json:
            df, pf = extract_pddl(output)
        else:
            output_json = json.loads(output)
            for change in output_json["domain"]:
                df = df.replace(change["original"], change["fixed"])
            for change in output_json["problem"]:
                pf = pf.replace(change["original"], change["fixed"])
        with open("out_df.pddl", "w") as f:
            f.write(df)
        with open("out_pf.pddl", "w") as f:
            f.write(pf)
        print("===DF===")
        print(df)
        print("===PF===")
        print(pf)
        resp = run_solver(df, pf)
        if not args.refine:
            break
        if resp["status"] == "error":
            print("===ERROR===")
            error = resp["result"]["error"]
            print(error)
            if error == prev_error:
                print("Same error as last time, exiting")
                break
            prev_error = error
            feedback = ""
            if "syntax error" in error:
                line_num = int(error.split("syntax error in line ")[-1].split(",")[0])
                if "/domain.pddl: " in error:
                    error_line = df.split("\n")[line_num - 1]
                elif "/problem.pddl: " in error:
                    error_line = pf.split("\n")[line_num - 1]
                feedback = "There is a syntax error in line " + str(line_num) + ": " + error_line + "\n"
            else:
                feedback = error
            print("===FEEDBACK===")
            print(feedback)
            if not args.det:
                prompt.append({"role": "user", "content": feedback + "Please fix the error and try again. Be sure to output the complete domain and problem files."})
            else:
                change_json_example = {
                    "domain": [
                        {
                            "original": "original_line1",
                            "fixed": "changed_line1"
                        },
                        {
                            "original": "original_line2",
                            "fixed": "changed_line2"
                        },
                    ],
                    "problem": [
                        {
                            "original": "original_line1",
                            "fixed": "changed_line1"
                        },
                        {
                            "original": "original_line2",
                            "fixed": "changed_line2"
                        },
                    ]
                }
                prompt.append({"role": "user", "content": feedback + "Please fix the error and try again. Use the following JSON format indicating what  to change.\n" + json.dumps(change_json_example, indent=4)})
        if args.manual:
            print("Continue? (y/n)")
            if input() == "n":
                break
    else:
        print([x ["name"] for x in resp['result']['plan']])
    #print(resp)    
    print("Iteration", iterations)
        


run_gpt()