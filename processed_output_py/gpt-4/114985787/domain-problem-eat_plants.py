from py2pddl import goal, init

from py2pddl import Domain, create_type
from py2pddl import predicate, action

class WildernessSurvivalDomain(Domain):    

    Shelter = create_type("Shelter")
    Food = create_type("Food")
    Snare = create_type("Snare")
    Area = create_type("Area")
    
    @predicate(Shelter, Area)
    def shelter_at(self, s, a):
        pass

    @predicate(Food, Area)
    def food_at(self, f, a):
        pass
    
    @predicate(Snare, Area)
    def snare_at(self, s, a):
        pass

    @action(Shelter, Area)
    def build_shelter(self, s, a):
        precond = []
        effect = [self.shelter_at(s, a)]
        return precond, effect

    @action(Snare, Area)
    def build_snare(self, sn, a):
        precond = []
        effect = [self.snare_at(sn, a)]
        return precond, effect

    @action(Food, Area)
    def eat_plants(self, f, a):
        precond = [self.food_at(f, a)]
        effect = [~self.food_at(f, a)]
        return precond, effect

class WildernessSurvivalProblem3(WildernessSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.foods = WildernessSurvivalDomain.Food.create_objs([1], prefix="f")
        self.areas = WildernessSurvivalDomain.Area.create_objs(["a1"])

    @init
    def init(self):
        return [self.food_at(self.foods[1], self.areas["a1"])]

    @goal
    def goal(self):
        # the goal is to not have any food at the area a1
        return [~self.food_at(self.foods[1], self.areas["a1"])]
