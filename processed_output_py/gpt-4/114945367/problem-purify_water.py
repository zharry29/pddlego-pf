
from py2pddl import goal, init

class SurvivalProblem3(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.waters = SurvivalDomain.Water.create_objs([1], prefix="w")
        self.locations = SurvivalDomain.Location.create_objs(["l1"])

    @init
    def init(self):
        at = [self.water_at(self.waters[1], self.locations["l1"])]
        return at

    @goal
    def goal(self):
        return [self.purified(self.waters[1])]
