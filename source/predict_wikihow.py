import os
import openai
import backoff
import argparse
from pathlib import Path

parser = argparse.ArgumentParser()
# parser.add_argument('--key', default='harry_ccbft', type=str, help='The name of the OpenAI API key file.')
parser.add_argument('--model', default='', required=True, type=str, help='OpenAI model name.')

args = parser.parse_args()
# openai.api_key = open(f'../../_private/{args.key}.key').read()
openai.api_key ="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"
@backoff.on_exception(backoff.expo, (openai.error.RateLimitError, openai.error.APIError, openai.error.Timeout))
def run_chatgpt(message, model=args.model, temperature=0):
    try:
        ret = openai.ChatCompletion.create(
            model=model,
            messages=message,
            max_tokens = 1000
        )
    except openai.error.InvalidRequestError:
        if model == "gpt-3.5-turbo":
            model = "gpt-3.5-turbo-16k"
        elif model == "gpt-4":
            model = "gpt-4-32k"
        ret = openai.ChatCompletion.create(
            model=model,
            messages=message,
            max_tokens = 1000
        )
    gen_text = dict(ret["choices"][0]["message"])["content"]
    return gen_text

def parse_output(list_files):
    # Assumes a DF followed by some PFs
    # For now, do no parsing
    return list_files[0], list_files[1:]

# def predict_df_pfs(nl_text, tasks):
#     prompt = "Given the text below:\n"
#     prompt += nl_text + "\n"
#     prompt += f"Your task is to generate a PDDL domain file, and problems file corresponds to the following tasks:\n"
#     for i, task in enumerate(tasks):
#         prompt += f"{i+1}. " + task + '\n'
#     prompt += "I'll ask you to generate the domain file first, followed by the problems files. Ready?"
#     message = [
#         {"role": "user", "content": prompt},
#         {"role": "assistant", "content": "Yes, I'm ready."},
#     ]
#     pddl_filenames = ["domain file"] + [f"problem file {i+1}: {tasks[i]}" for i in range(len(tasks))]
#     output = []
#     for pddl_filename in pddl_filenames:
#         message.append({"role": "user", "content": f"Now, please only generate {pddl_filename}, WITHOUT any explanation."})
#         print(message)
#         #raise SystemExit
#         gen_text = run_chatgpt(message)
#         #print(gen_text)
#         #raise SystemExit
#         output.append(gen_text)
#         message.append({"role": "assistant", "content": gen_text})

#     df, pfs = parse_output(output)
#     return df, pfs

# for id in os.listdir("../data/wikihow"):
#     for fname in os.listdir("../data/wikihow/" + id):
#         if fname.startswith("wikihow-") and fname.endswith(".txt"):
#             nl_text = open("../data/wikihow/" + id + f"/{fname}", "r").read()
#             tasks = []
#             pf_fnames = []
#             for pf_fname in os.listdir("../data/wikihow/" + id + "/problems"):
#                 pf_fnames.append(pf_fname)
#                 task_name = pf_fname.strip("problem-").strip(".pddl").replace("_", " ")
#                 tasks.append(task_name)
#             df, pfs = predict_df_pfs(nl_text, tasks)
#             Path(f"../output/wikihow/{args.model}/{id}").mkdir(parents=True, exist_ok=True)
#             with open(f"../output/wikihow/{args.model}/{id}/domain.pddl", 'w') as f:
#                 f.write(df)
#             for pf_fname, pf in zip(pf_fnames, pfs):
#                 with open(f"../output/wikihow/{args.model}/{id}/{pf_fname}", 'w') as f:
#                     f.write(pf)

def predict_df_pfs(nl_text, tasks):
    prompt = "Given the text below:\n"
    prompt += nl_text + "\n"
    prompt += f"Your task is to generate a PDDL domain file in python format, and problems file in python format corresponds to the following tasks(You'd be better off generating more pddl actions so that it's easier to plan tasks afterwards.):\n"
    for i, task in enumerate(tasks):
        prompt += f"{i+1}. " + task + '\n'
    prompt += ''' Here is an PDDL domain file in python format example: 
    "
    from py2pddl import Domain, create_type
    from py2pddl import predicate, action

    class AirCargoDomain(Domain):

        Plane = create_type("Plane")
        Cargo = create_type("Cargo")
        Airport = create_type("Airport")

        @predicate(Cargo, Airport)
        def cargo_at(self, c, a):
            """Complete the method signature and specify
            the respective types in the decorator"""

        @predicate(Plane, Airport)
        def plane_at(self, p, a):
            """Complete the method signature and specify
            the respective types in the decorator"""

        @predicate(Cargo, Plane)
        def in_(self, c, p):
            """Complete the method signature and specify
            the respective types in the decorator"""

        @action(Cargo, Plane, Airport)
        def load(self, c, p, a):
            precond = [self.cargo_at(c, a), self.plane_at(p, a)]
            effect = [~self.cargo_at(c, a), self.in_(c, p)]
            return precond, effect

        @action(Cargo, Plane, Airport)
        def unload(self, c, p, a):
            precond = [self.in_(c, p), self.plane_at(p, a)]
            effect = [self.cargo_at(c, a), ~self.in_(c, p)]
            return precond, effect

        @action(Plane, Airport, Airport)
        def fly(self, p, orig, dest):
            precond = [self.plane_at(p, orig)]
            effect = [~self.plane_at(p, orig), self.plane_at(p, dest)]
            return precond, effect
        "
    Here is a PDDL problem file in python format example:
    "
    from py2pddl import goal, init

    class AirCargoProblem(AirCargoDomain):

        def __init__(self):
            super().__init__()
            self.cargos = AirCargoDomain.Cargo.create_objs([1, 2], prefix="c")
            self.planes = AirCargoDomain.Plane.create_objs([1, 2], prefix="p")
            self.airports = AirCargoDomain.Airport.create_objs(["sfo", "jfk"])

        @init
        def init(self):
            at = [self.cargo_at(self.cargos[1], self.airports["sfo"]),
                self.cargo_at(self.cargos[2], self.airports["jfk"]),
                self.plane_at(self.planes[1], self.airports["sfo"]),
                self.plane_at(self.planes[2], self.airports["jfk"]),]
            return at

        @goal
        def goal(self):
            return [self.cargo_at(self.cargos[1], self.airports["jfk"]),
                    self.cargo_at(self.cargos[2], self.airports["sfo"])]"

    I'll ask you to generate the domain file first, followed by the problems files. Ready?'''
    message = [
        {"role": "user", "content": prompt},
        {"role": "assistant", "content": "Yes, I'm ready."},
    ]
    pddl_filenames = ["domain file"] + [f"problem file {i+1}: {tasks[i]}" for i in range(len(tasks))]
    output = []
    for pddl_filename in pddl_filenames:
        message.append({"role": "user", "content": f"Now, please only generate {pddl_filename}, WITHOUT any explanation."})
        #print(message)
        #raise SystemExit
        gen_text = run_chatgpt(message)
        #print(gen_text)
        #raise SystemExit
        output.append(gen_text)
        message.append({"role": "assistant", "content": gen_text})

    df, pfs = parse_output(output)
    return df, pfs
count=0
for id in os.listdir("../data/wikihow"):
    count+=1
    for fname in os.listdir("../data/wikihow/" + id):
        print(fname)
        if fname.startswith("wikihow-") and fname.endswith(".txt"):
            nl_text = open("../data/wikihow/" + id + f"/{fname}", "r",encoding="utf-8").read()
            tasks = []
            pf_fnames = []
            for pf_fname in os.listdir("../data/wikihow/" + id + "/problems"):
                print(fname,pf_fname)
                pf_fnames.append(pf_fname)
                task_name = pf_fname.strip("problem-").strip(".pddl").replace("_", " ")
                tasks.append(task_name)
            df, pfs = predict_df_pfs(nl_text, tasks)
            print(df,pfs)
            Path(f"../output_python/wikihow/{args.model}/{id}").mkdir(parents=True, exist_ok=True)
            with open(f"../output_python/wikihow/{args.model}/{id}/domain.py", 'w') as f:
                f.write(df)
            for pf_fname, pf in zip(pf_fnames, pfs):
                print("write",pf_fname)
                pf_fname = pf_fname.split(".")[0]+".py"
                with open(f"../output_python/wikihow/{args.model}/{id}/{pf_fname}", 'w') as f:
                    f.write(pf)
                    print("writesuccess",pf_fname)