
from py2pddl import goal, init

class SurvivalProblem2(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.survivor = SurvivalDomain.Survivor.create_objs([1], prefix="s")
        self.island = SurvivalDomain.Island.create_objs([1], prefix="i")
        self.water = SurvivalDomain.Water.create_objs([1], prefix="w")

    @init
    def init(self):
        return [self.is_on(self.survivor[1], self.island[1])]

    @goal
    def goal(self):
        return [self.has_water(self.survivor[1], self.water[1])]
