from py2pddl import goal, init

from py2pddl import Domain, create_type
from py2pddl import predicate, action

class WoodsSurvivalDomain(Domain):

    Water = create_type("Water")
    Shelter = create_type("Shelter")
    Fire = create_type("Fire")
    Tinder = create_type("Tinder")
    Fuel = create_type("Fuel")
    Kindling = create_type("Kindling")

    @predicate(Water)
    def has_water(self, water):
        pass

    @predicate(Shelter)
    def has_shelter(self, shelter):
        pass
    
    @predicate(Fire)
    def has_fire(self, fire):
        pass

    @predicate(Tinder)
    def has_tinder(self, tinder):
        pass

    @predicate(Kindling)
    def has_kindling(self, kindling):
        pass

    @predicate(Fuel)
    def has_fuel(self, fuel):
        pass

    @action(Water)
    def fill_water(self, water):
        precond = []
        effect = [self.has_water(water)]
        return precond, effect

    @action(Shelter)
    def build_teepee(self, shelter):
        precond = []
        effect = [self.has_shelter(shelter)]
        return precond, effect

    @action(Fuel)
    def collect_fuel(self, fuel):
        precond = []
        effect = [self.has_fuel(fuel)]
        return precond, effect

    @action(Tinder)
    def find_tinder(self, tinder):
        precond = []
        effect = [self.has_tinder(tinder)]
        return precond, effect

    @action(Kindling)
    def gather_kindling(self, kindling):
        precond = []
        effect = [self.has_kindling(kindling)]
        return precond, effect

    @action(Fire, Tinder, Kindling, Fuel)
    def start_fire(self, fire, tinder, kindling, fuel):
        precond = [self.has_tinder(tinder), self.has_kindling(kindling), self.has_fuel(fuel)]
        effect = [self.has_fire(fire)]
        return precond, effect

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
