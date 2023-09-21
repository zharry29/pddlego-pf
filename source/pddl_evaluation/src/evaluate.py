import sys
sys.path.insert(1, '../src/')
sys.path.insert(1, '../src/pddl-parser')
from pddl_parser.PDDL import PDDL_Parser
import pickle
import os
import numpy as np
import re
from pathlib import Path
import signal
import time
from func_timeout import func_set_timeout
import func_timeout
def handler(signum, frame):
   print("Exceeding 30 seconds, killed.")
   raise TimeoutError("end of time")

# signal.signal(signal.SIGALRM, handler)

import argparse
parser = argparse.ArgumentParser()
parser.add_argument('--model', type=str)
parser.add_argument('--prompt', type=str, default='')
parser.add_argument('--id', type=str, default='')
args = parser.parse_args()

prompt_str = "_" + args.prompt if args.prompt != "" else ""

class Planner:

    # -----------------------------------------------
    # Solve
    # -----------------------------------------------

    def solve(self, parser):
        # Parser
        # parser = PDDL_Parser()
        # parser.parse_domain(domain)
        # parser.parse_problem(problem)
        # Parsed data
        state = parser.state
        goal_pos = parser.positive_goals
        goal_not = parser.negative_goals
        # Do nothing
        if self.applicable(state, goal_pos, goal_not):
            return []
        # Grounding process
        ground_actions = []
        for action in parser.actions:
            for act in action.groundify(parser.objects, parser.types):
                ground_actions.append(act)
        # Search
        visited = set([state])
        fringe = [state, None]
        while fringe:
            state = fringe.pop(0)
            plan = fringe.pop(0)
            for act in ground_actions:
                if self.applicable(state, act.positive_preconditions, act.negative_preconditions):
                    new_state = self.apply(state, act.add_effects, act.del_effects)
                    if new_state not in visited:
                        if self.applicable(new_state, goal_pos, goal_not):
                            full_plan = [act]
                            while plan:
                                act, plan = plan
                                full_plan.insert(0, act)
                            return full_plan
                        visited.add(new_state)
                        fringe.append(new_state)
                        fringe.append((act, plan))
        return None

    # -----------------------------------------------
    # Applicable
    # -----------------------------------------------

    def applicable(self, state, positive, negative):
        return positive.issubset(state) and negative.isdisjoint(state)

    # -----------------------------------------------
    # Apply
    # -----------------------------------------------

    def apply(self, state, positive, negative):
        return state.difference(negative).union(positive)
#args.model="gpt-4"
true_dir = '../../../data/wikihow'
pred_dir = '../../../processed_output/'+args.model

#f'../data/evaluation/actions_generation/pred/{args.model}{prompt_str}/'
cache_dir = '../data/evaluation/cache/'

#Path(f"../data/evaluation/plan/{args.model}{prompt_str}").mkdir(parents=True, exist_ok=True)
Path(f"../../../processed_output/"+args.model+"/solve_result").mkdir(parents=True, exist_ok=True)
class Tester:
    def __init__(self, cache_dir = '../data/evaluation/cache/'):
        self.cache_dir = cache_dir
    def check_action_list(self, true_dir, test_case, output_actions):
        ground_truth_actions = ''.join(open('{true_dir}/{test_case}/actions.txt'.format(
                                    true_dir = true_dir,
                                    test_case = test_case
                                )).readlines())
        all_action_texts = [
            ac[:-1].replace(':action', '').strip()
            for ac in re.findall(':action\s+.+;', ground_truth_actions)
        ]
        found = 0
        for ac in all_action_texts:
            if re.search(':action\s+{}'.format(ac), output_actions):
                found += 1
        return found, len(all_action_texts)

    def eval_summary_stat(self, case_results_raw):
        summary = {}

        summary['intrinsic'] = {
            'pass': 0,
            'parsing_error': 0,
            'action_incomplete': 0
        }   
        for output_action_file in case_results_raw:
            summary['intrinsic'][case_results_raw[output_action_file]['intrinsic']] += 1

        summary['extrinsic'] = {}
        for output_action_file in case_results_raw:
            if case_results_raw[output_action_file]['extrinsic'] is None:
                continue
            
            for problem in case_results_raw[output_action_file]['extrinsic']:
                if problem not in summary['extrinsic']:
                    summary['extrinsic'][problem] = {'solved': 0, 'unsolved': 0}
                if case_results_raw[output_action_file]['extrinsic'][problem] == 'solved':
                    summary['extrinsic'][problem]['solved'] += 1
                else:
                    summary['extrinsic'][problem]['unsolved'] += 1
        
        for problem in summary['extrinsic']:
            summary['extrinsic'][problem]['succ_rate'] = summary['extrinsic'][problem]['solved'] / sum(summary['extrinsic'][problem].values())

        return summary

    def eval_action_generation(self, true_dir, pred_dir):
        self.true_dir = true_dir
        self.pred_dir = pred_dir
        case_results_raw = {}
        print("1111111",os.listdir(pred_dir))
        for fname in os.listdir(pred_dir):
        #for fname in ["114905535"]:
            if "actions" in fname or not fname.startswith(args.id) or fname=="solve_result":
                continue
            #proc_id = fname[:-4]
            proc_id = fname
            print(proc_id)

            # domain_header_fp = '{true_dir}/{test_case}/domain_header.pddl'.format(
            #     true_dir = true_dir,
            #     test_case = proc_id
            # )
            # domain_header = ''.join(open(domain_header_fp).readlines())
            output_action_file = f"{proc_id}.txt"
            case_results_raw[output_action_file] = {
                'intrinsic': 'pass',
                'extrinsic': None
            }
            # # print(0)
            # # 0. getting the domain file
            # output_actions = ''.join(open('{pred_dir}/{action_file}'.format(
            #     pred_dir = pred_dir,
            #     action_file = output_action_file
            # )).readlines())
            pred_domain = ''.join(open('{pred_dir}/{test_case}/domain.pddl'.format(
                pred_dir = pred_dir,
                test_case = proc_id
            )).readlines())
            # print(1)
            # 1. Intrinsic check domain file
            tmp_domain_file = cache_dir + 'tmp_action_generation.pddl'
            with open(cache_dir + 'tmp_action_generation.pddl', 'w') as file:
                file.write(pred_domain)
            #print(1.1)
            # 1.1 check if parse-able
            parser = PDDL_Parser()
            intrinsic_done = False
            try:
                parser.parse_domain(tmp_domain_file)
                with open(pred_dir + f"{proc_id}_actions.pkl", 'wb') as file:
                    pickle.dump(parser.actions, file)
            except:
                case_results_raw[output_action_file]['intrinsic'] = 'parsing_error'
                #continue
                intrinsic_done = True
                #with open(pred_dir + f"{proc_id}_actions.pkl", 'wb') as file:
                #    pickle.dump(None, file)
            # print(1.2)
            # 1.2 check if actions are all found
            if not intrinsic_done:
                action_found, action_total = self.check_action_list(true_dir, proc_id, pred_domain)
                if action_total > action_found:
                    case_results_raw[output_action_file]['intrinsic'] = 'action_incomplete'
                    #continue
            #print(2)
            # 2. Extrinsic evaluations
            case_results_raw[output_action_file]['extrinsic'] = {}
            problem_dir = '{pred_dir}/{test_case}/'.format(
                pred_dir = pred_dir,
                test_case = proc_id
            )
            for problem in os.listdir(problem_dir):
                # print('2:',problem)
                if '.pddl' not in problem or problem=="domain.pddl":
                    continue
                problem_file = '{pred_dir}/{test_case}/{problem}'.format(
                    pred_dir = pred_dir,
                    test_case = proc_id,
                    problem = problem
                )
                try:
                    plan = self.eval_unit_action_generation(tmp_domain_file, problem_file)
                except func_timeout.exceptions.FunctionTimedOut as e:
                    plan = TimeoutError()
                # plan = self.eval_unit_action_generation(tmp_domain_file, problem_file)
                #print(plan)
                with open(pred_dir+f"/solve_result/{proc_id}_{problem[:-5]}.txt", 'w') as f:
                    if isinstance(plan, TimeoutError):
                        case_results_raw[output_action_file]['extrinsic'][problem] = 'timeout'
                        f.write("Error: " + "Running time exceeds 30 seconds")
                    elif isinstance(plan, TypeError) or isinstance(plan, AttributeError) or isinstance(plan, ValueError):
                        case_results_raw[output_action_file]['extrinsic'][problem] = 'parse_error'
                        f.write("Error: " + str(plan))
                    elif plan:
                        case_results_raw[output_action_file]['extrinsic'][problem] = 'solved'
                        for ac in plan:
                            f.write(ac.name + " ('" + "', '".join(ac.parameters) + "')\n")
                    else:
                        case_results_raw[output_action_file]['extrinsic'][problem] = 'unsolved'
                        f.write("No solution")
                print(case_results_raw[output_action_file]['extrinsic'][problem])

                #action_sequence = [ac.name, ac.parameters for ac in plan]
                #print(action_sequence)
            
            #summary = self.eval_summary_stat(case_results_raw)
            #eval_results[proc_id] = {
            #    'summary': summary,
            #    'raw': case_results_raw
            #}
            
        return case_results_raw

    @func_set_timeout(10)
    def eval_unit_action_generation(self, domain_file, problem_file):
        # signal.alarm(10)
        try:
            parser = PDDL_Parser()
            parser.parse_domain(domain_file)
            parser.parse_problem(problem_file)
            planner = Planner()
            plan = planner.solve(parser)
        except (TimeoutError, TypeError, AttributeError, ValueError) as e:
            return e
        # signal.alarm(0)
        return plan
        
T = Tester(cache_dir)

eval_results = T.eval_action_generation(true_dir, pred_dir)#['1']
print(eval_results)
pf_outcome = []
for fname, report in eval_results.items():
    for pf_name, outcome in report["extrinsic"].items():
         pf_outcome.append(outcome)
print("Total PFs:", len(pf_outcome))
print("Solved PFs:", pf_outcome.count("solved"))
print("Unsolved PFs:", pf_outcome.count("unsolved"))
print("Timeout PFs:", pf_outcome.count("timeout"))
print("Parsing Error PFs:", pf_outcome.count("parse_error"))

# {'113996609.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-catch_cook_fish.pddl': 'solved', 'problem-clean_water.pddl': 'solved', 'problem-escape_island.pddl': 'solved', 'problem-start_fire.pddl': 'solved'}}, 
#  '114061278.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-fill_the_glass.pddl': 'solved', 'problem-free_the_meat_from_coconut.pddl': 'solved', 'problem-hit_coconut_with_mallet.pddl': 'solved', 'problem-poke_eyes.pddl': 'solved', 'problem-remove_fibre_from_coconut_meat.pddl': 'solved', 'problem-wrap_the_coconut_in_towel.pddl': 'solved'}}, 
#  '114187233.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-get_coconut_juice.pddl': 'solved', 'problem-get_coconut_meat_without_oven.pddl': 'solved', 'problem-get_coconut_meat_with_oven.pddl': 'timeout'}}, 
#  '114394848.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-hacking1_1.pddl': 'solved', 'problem-hacking2_1.pddl': 'solved', 'problem-hacking2_2.pddl': 'solved'}},
#  '114406878.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-boil_water.pddl': 'solved', 'problem-build_teepee.pddl': 'solved', 'problem-collect_fuel.pddl': 'solved', 'problem-find_tinder.pddl': 'solved', 'problem-gather_kindling.pddl': 'solved', 'problem-start_fire.pddl': 'solved'}}, 
#  '114540181.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-dehydration.pddl': 'solved', 'problem-escape.pddl': 'solved', 'problem-hunger.pddl': 'solved'}}, 
#  '114741230.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-create_cult.pddl': 'solved', 'problem-ready_sc.pddl': 'solved', 'problem-remove_players.pddl': 'solved'}}, 
#  '114756331.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-avoid_quicksand.pddl': 'solved', 'problem-get_feet_out.pddl': 'solved', 'problem-get_out_deep.pddl': 'solved'}}, 
#  '114771414.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-construct_a_sturdy_shelter.pddl': 'solved', 'problem-hunt_animal_for_food.pddl': 'solved', 'problem-make_a_fire.pddl': 'solved'}}, 
#  '114778947.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-pick_car_lock.pddl': 'solved', 'problem-pick_easy_lock.pddl': 'solved', 'problem-pick_hard_lock.pddl': 'solved'}}, 
#  '114905535.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-build_fire.pddl': 'unsolved', 'problem-find_water.pddl': 'solved', 'problem-get_food.pddl': 'unsolved', 'problem-make_smoke_signal.pddl': 'unsolved'}}, 
#  '114926023.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-build_raft.pddl': 'solved', 'problem-create_shelter.pddl': 'solved', 'problem-prepare_meat.pddl': 'solved'}}, 
#  '114928286.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-be-amazed.pddl': 'solved', 'problem-get-materials.pddl': 'solved', 'problem-throw-hotdogs.pddl': 'solved'}}, 
#  '114934221.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-board_ship.pddl': 'solved', 'problem-defend_position.pddl': 'solved', 'problem-dispel_shark.pddl': 'unsolved', 'problem-ultimate_win.pddl': 'solved'}}, 
#  '114941614.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-do_everything.pddl': 'unsolved', 'problem-drink_water.pddl': 'unsolved', 'problem-sleep_in_shelter.pddl': 'unsolved'}}, 
#  '114945367.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-build_a_shelter.pddl': 'solved', 'problem-collect_water.pddl': 'solved', 'problem-purify_water.pddl': 'unsolved', 'problem-start_a_fire.pddl': 'unsolved'}}, 
#  '114971046.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-get_essential_items.pddl': 'solved', 'problem-reinforce_basement.pddl': 'solved', 'problem-stay_sheltered_with_food.pddl': 'solved'}}, 
#  '114975402.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-assembling-disguises.pddl': 'solved', 'problem-assembling_a_detective_kit.pddl': 'timeout', 'problem-buy_a_bag.pddl': 'solved', 'problem-get-all-stationery.pddl': 'unsolved'}}, 
#  '114985787.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-build_shelter.pddl': 'solved', 'problem-build_snare.pddl': 'solved', 'problem-eat_plants.pddl': 'solved'}}, '114986868.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-drink_water.pddl': 'solved', 'problem-eat_fish.pddl': 'solved', 'problem-make_fire.pddl': 'solved', 'problem-safe_in_cave.pddl': 'solved'}}, 
#  '114994170.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-collect-water.pddl': 'solved', 'problem-get-home.pddl': 'solved', 'problem-prepare-for-attack.pddl': 'solved', 'problem-survive-emp.pddl': 'unsolved', 'problem-turn-on-radio.pddl': 'solved'}}, 
#  '115004877.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-get-papyrus.pddl': 'solved', 'problem-get-strips.pddl': 'solved', 'problem-process-strips.pddl': 'solved'}}, 
#  '115030714.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-1-cook-food.pddl': 'timeout', 'problem-2-serve-drinks.pddl': 'timeout', 'problem-3-decorate.pddl': 'solved'}}, 
#  '115033247.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-finishing_papyrus.pddl': 'solved', 'problem-preparing_papyrus.pddl': 'solved', 'problem-soak_and_flatten_papyrus_strips.pddl': 'solved'}}, 
#  '115168608.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-get_materials.pddl': 'solved', 'problem-get_papyrus_plant.pddl': 'solved', 'problem-make_papyrus.pddl': 'solved'}}, 
#  '115230790.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-final.pddl': 'solved', 'problem-listen_to_astronomers_predictions_and_move.pddl': 'solved', 'problem-move_to_bunker.pddl': 'solved'}}, 
#  '115237120.txt': {'intrinsic': 'pass', 'extrinsic': {'problem-fill-inventory.pddl': 'solved', 'problem-find-shelter.pddl': 'solved', 'problem-heal-old-man.pddl': 'solved'}}}