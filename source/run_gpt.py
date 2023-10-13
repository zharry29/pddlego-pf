import openai
import backoff

openai.api_key = open(f'../../_private/harry_ccbft.key').read()

@backoff.on_exception(backoff.expo, (openai.error.RateLimitError, openai.error.APIError, openai.error.Timeout, openai.error.ServiceUnavailableError))
def run_chatgpt(message, model, temperature=0):
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