import sys
#sys.path.insert(1, '../src/')
sys.path.insert(1, './pddl-parser')
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


class Tester:
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
    
    def eval_action_generation(self, df, pf):
        # 1.1 check if parse-able
        parser = PDDL_Parser()
        try:
            parser.parse_domain(df)
        except:
            print("parsing error")

        # 2. Extrinsic evaluations
        try:
            plan = self.eval_unit_action_generation(df, pf)
        except func_timeout.exceptions.FunctionTimedOut as e:
            plan = TimeoutError()

        if isinstance(plan, TimeoutError):
            print("Error: " + "Running time exceeds 30 seconds")
        elif isinstance(plan, TypeError) or isinstance(plan, AttributeError) or isinstance(plan, ValueError):
            print("Error: " + str(plan))
        elif plan:
            print('solved')
            for ac in plan:
                print(ac.name + " ('" + "', '".join(ac.parameters) + "')")
        else:
            print("No solution")
            
        #return case_results_raw
        return None

def pddl_solve(df, pf):       
    T = Tester()
    eval_results = T.eval_action_generation(df, pf)
    return eval_results