
from py2pddl import goal, init

class SurvivalProblem4(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.survivor = SurvivalDomain.Survivor.create_objs([1], prefix="s")
        self.island = SurvivalDomain.Island.create_objs([1], prefix="i")
        self.fire = SurvivalDomain.Fire.create_objs([1], prefix="f")

    @init
    def init(self):
        return [self.is_on(self.survivor[1], self.island[1]), self.fire_on(self.fire[1], self.island[1])]

    @goal
    def goal(self):
        return [self.make_smoke_signal(self.survivor[1], self.fire[1])]
