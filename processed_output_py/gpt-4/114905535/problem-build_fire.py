
from py2pddl import goal, init

class SurvivalProblem1(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.survivor = SurvivalDomain.Survivor.create_objs([1], prefix="s")
        self.island = SurvivalDomain.Island.create_objs([1], prefix="i")

    @init
    def init(self):
        return [self.is_on(self.survivor[1], self.island[1])]

    @goal
    def goal(self):
        return [self.fire_on(self.survivor[1], self.island[1])]
