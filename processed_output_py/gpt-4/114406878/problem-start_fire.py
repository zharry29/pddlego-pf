
from py2pddl import goal, init

class WoodsSurvivalProblem6(WoodsSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.fires = WoodsSurvivalDomain.Fire.create_objs([1])
        self.tinders = WoodsSurvivalDomain.Tinder.create_objs([1])
        self.kindlings = WoodsSurvivalDomain.Kindling.create_objs([1])
        self.fuels = WoodsSurvivalDomain.Fuel.create_objs([1])

    @init
    def init(self):
        at = [self.has_tinder(self.tinders[1]), self.has_kindling(self.kindlings[1]), self.has_fuel(self.fuels[1])]
        return at

    @goal
    def goal(self):
        return [self.has_fire(self.fires[1])]
