
from py2pddl import goal, init

class SurvivalProblem_BuildRaft(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.rafts = SurvivalDomain.Raft.create_objs([1], prefix="r")

    @init
    def init(self):
        at = []
        return at

    @goal
    def goal(self):
        return [self.has_raft(self.rafts[1])]
