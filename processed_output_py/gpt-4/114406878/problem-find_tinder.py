
from py2pddl import goal, init

class WoodsSurvivalProblem4(WoodsSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.tinders = WoodsSurvivalDomain.Tinder.create_objs([1])

    @init
    def init(self):
        return []

    @goal
    def goal(self):
        return [self.has_tinder(self.tinders[1])]
