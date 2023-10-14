
from py2pddl import goal, init

class WoodsSurvivalProblem2(WoodsSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.shelters = WoodsSurvivalDomain.Shelter.create_objs([1])

    @init
    def init(self):
        return []

    @goal
    def goal(self):
        return [self.has_shelter(self.shelters[1])]
