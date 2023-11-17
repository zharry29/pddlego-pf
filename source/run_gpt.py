import openai
import backoff

openai.api_key = open(f'../../_private/harry_ai2.key').read()

@backoff.on_exception(backoff.expo, (openai.error.RateLimitError, openai.error.APIError, openai.error.Timeout, openai.error.ServiceUnavailableError))
def run_chatgpt(message, model, force_json=False, temperature=0):
    output_format = "json_object" if force_json else "text"
    
    ret = openai.ChatCompletion.create(
        model=model,
        messages=message,
        max_tokens = 1000,
        response_format = {"type": output_format}
    )
    gen_text = dict(ret["choices"][0]["message"])["content"]
    return gen_text