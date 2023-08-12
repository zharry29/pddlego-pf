import os
import openai
import backoff
import argparse
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument('--key', default='harry_ccbft', type=str, help='The name of the OpenAI API key file.')

args = parser.parse_args()
openai.api_key = open(f'../../_private/{args.key}.key').read()

@backoff.on_exception(backoff.expo, (openai.error.RateLimitError, openai.error.APIError, openai.error.Timeout))
def run_chatgpt(prompt, model="gpt-3.5-turbo", temperature=0):
    ret = openai.ChatCompletion.create(
        model=model,
        messages=prompt
        )
    gen_text = dict(ret["choices"][0]["message"])["content"]
    return gen_text

def parse_output(gen_text):
    return "placeholder DF", ["placeholder PF1", "placeholder PF2"]

def predict_df_pfs(nl_text, tasks):
    prompt = "Given the text below:\n"
    prompt += nl_text + "\n"
    prompt += f"Generate a PDDL domain file, and problems file corresponds to the following tasks:\n"
    for task in tasks:
        prompt += "- " + task + '\n'
    gen_text = run_chatgpt(prompt)
    df, pfs = parse_output(gen_text)

for id in os.listdir("../data/wikihow"):
    for fname in os.listdir("../data/wikihow/" + id):
        if fname.startswith("wikihow-") and fname.endswith(".txt"):
            nl_text = open("../data/wikihow/" + id + "/nl_text.txt", "r").read()
        tasks = []
        pf_fnames = []
        for pf_fname in os.listdir("../data/wikihow/" + id + "/problems"):
            pf_fnames.append(pf_fname)
            task_name = pf_fname.strip("problem-").strip(".pddl").replace("_", " ")
            tasks.append(task_name)
        df, pfs = predict_df_pfs(nl_text, tasks)
        Path(f"../output/wikihow/{id}").mkdir(parents=True, exist_ok=True)
        with open(f"../output/wikihow/{id}/domain.pddl", 'w') as f:
            f.write(df)
        for pf_fname, pf in zip(pf_fnames, pfs):
            with open(f"../output/wikihow/{id}/{pf_fname}.pddl", 'w') as f:
                f.write(pf)