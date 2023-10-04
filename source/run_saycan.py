import os
import openai
from run_gpt import run_chatgpt
import argparse
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument('--key', default='harry_ccbft', type=str, help='The name of the OpenAI API key file.')
parser.add_argument('--model', default='', required=True, type=str, help='OpenAI model name.')

args = parser.parse_args()
openai.api_key = open(f'../../_private/{args.key}.key').read()

