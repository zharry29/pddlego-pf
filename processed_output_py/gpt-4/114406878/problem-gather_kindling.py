
from py2pddl import goal, init

class WoodsSurvivalProblem5(WoodsSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.kindlings = WoodsSurvivalDomain.Kindling.create_objs([1])

    @init
    def init(self):
        return []

    @goal
    def goal(self):
        return [self.has_kindling(self.kindlings[1])]
