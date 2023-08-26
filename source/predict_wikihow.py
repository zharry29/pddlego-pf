import os
import openai
import backoff
import argparse
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument('--key', default='harry_ccbft', type=str, help='The name of the OpenAI API key file.')
parser.add_argument('--model', default='', required=True, type=str, help='OpenAI model name.')

args = parser.parse_args()
openai.api_key = open(f'../../_private/{args.key}.key').read()

@backoff.on_exception(backoff.expo, (openai.error.RateLimitError, openai.error.APIError, openai.error.Timeout))
def run_chatgpt(message, model=args.model, temperature=0):
    try:
        ret = openai.ChatCompletion.create(
            model=model,
            messages=message
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

def predict_df_pfs(nl_text, tasks):
    prompt = "Given the text below:\n"
    prompt += nl_text + "\n"
    prompt += f"Your task is to generate a PDDL domain file, and problems file corresponds to the following tasks:\n"
    for i, task in enumerate(tasks):
        prompt += f"{i+1}. " + task + '\n'
    prompt += "I'll ask you to generate the domain file first, followed by the problems files. Ready?"
    message = [
        {"role": "user", "content": prompt},
        {"role": "assistant", "content": "Yes, I'm ready."},
    ]
    pddl_filenames = ["domain file"] + [f"problem file {i+1}: {tasks[i]}" for i in range(len(tasks))]
    output = []
    for pddl_filename in pddl_filenames:
        message.append({"role": "user", "content": f"Now, please only generate {pddl_filename}, WITHOUT any explanation."})
        print(message)
        #raise SystemExit
        gen_text = run_chatgpt(message)
        #print(gen_text)
        #raise SystemExit
        output.append(gen_text)
        message.append({"role": "assistant", "content": gen_text})

    df, pfs = parse_output(output)
    return df, pfs

for id in os.listdir("../data/wikihow"):
    for fname in os.listdir("../data/wikihow/" + id):
        if fname.startswith("wikihow-") and fname.endswith(".txt"):
            nl_text = open("../data/wikihow/" + id + f"/{fname}", "r").read()
            tasks = []
            pf_fnames = []
            for pf_fname in os.listdir("../data/wikihow/" + id + "/problems"):
                pf_fnames.append(pf_fname)
                task_name = pf_fname.strip("problem-").strip(".pddl").replace("_", " ")
                tasks.append(task_name)
            df, pfs = predict_df_pfs(nl_text, tasks)
            Path(f"../output/wikihow/{args.model}/{id}").mkdir(parents=True, exist_ok=True)
            with open(f"../output/wikihow/{args.model}/{id}/domain.pddl", 'w') as f:
                f.write(df)
            for pf_fname, pf in zip(pf_fnames, pfs):
                with open(f"../output/wikihow/{args.model}/{id}/{pf_fname}", 'w') as f:
                    f.write(pf)