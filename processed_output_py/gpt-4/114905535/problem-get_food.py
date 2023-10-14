
from py2pddl import goal, init

class SurvivalProblem3(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.survivor = SurvivalDomain.Survivor.create_objs([1], prefix="s")
        self.island = SurvivalDomain.Island.create_objs([1], prefix="i")
        self.food = SurvivalDomain.Food.create_objs([1], prefix="f")

    @init
    def init(self):
        return [self.is_on(self.survivor[1], self.island[1]), self.food_on(self.food[1], self.island[1])]

    @goal
    def goal(self):
        return [self.has_food(self.survivor[1], self.food[1])]
