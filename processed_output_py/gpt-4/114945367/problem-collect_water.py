
from py2pddl import goal, init

class SurvivalProblem2(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.waters = SurvivalDomain.Water.create_objs([1], prefix="w")
        self.locations = SurvivalDomain.Location.create_objs(["l1"])

    @init
    def init(self):
        at = []
        return at

    @goal
    def goal(self):
        return [self.water_at(self.waters[1], self.locations["l1"])]
