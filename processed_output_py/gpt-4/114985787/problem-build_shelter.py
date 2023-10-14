
from py2pddl import goal, init

class WildernessSurvivalProblem1(WildernessSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.shelters = WildernessSurvivalDomain.Shelter.create_objs([1], prefix="s")
        self.areas = WildernessSurvivalDomain.Area.create_objs(["a1"])

    @init
    def init(self):
        return

    @goal
    def goal(self):
        return [self.shelter_at(self.shelters[1], self.areas["a1"])]
