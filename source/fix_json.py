from run_gpt import run_chatgpt

def fix_json(input):
    prompt = [
        {"role": "user", "content": "Fix the syntax error in this JSON file:\n" + input},
    ]
    model = "gpt-4"
    resp = run_chatgpt(prompt, model)
    output = []
    begin = False
    for line in resp.split('\n'):
        if line == "{":
            begin = True
        if begin:
            output.append(line)
        if line == "}":
            break
    return '\n'.join(output)