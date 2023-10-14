
from py2pddl import goal, init

class PartyProblem2(PartyDomain):

    def __init__(self):
        super().__init__()
        self.drinks = PartyDomain.Drink.create_objs(["green_tea", "sake", "soy_milk"], prefix="d")

    @init
    def init(self):
        at = []
        return at

    @goal
    def goal(self):
        return [self.drink_ready(self.drinks["green_tea"]),
                self.drink_ready(self.drinks["sake"]),
                self.drink_ready(self.drinks["soy_milk"])]
