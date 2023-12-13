# nl-to-pddl
 
This preliminary README only provides usage. Details will be added in the near future. 

First, install [TextWroldExpress](https://github.com/cognitiveailab/TextWorldExpress).

To run experiment on either Coin Collector or Cooking World:
> python run_coin.py|run_cooking.py --model MODEL --method METHOD --split SPLIT [--det] [--oc]

- `model`: OpenAI model names such as `gpt-3.5-turbo-1106`` or `gpt-4-1106-preview``
- `method`: one of `direct`` (Action-gen) or `pddl` (PDDL-gen and PDDL-edit)
- `split`: one of `dev` or `test`, or a singular number to specify a specifc example of that index
- `det`: must be used when `method` is `pddl`; if specified, use PDDL-edit, else PDDL-gen
- `oc`: whether to overwrite existing cache; if not specified, will use the previous cache