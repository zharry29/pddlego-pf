
from py2pddl import Domain, create_type
from py2pddl import predicate, action


class SurvivalDomain(Domain):

    Survivor = create_type("Survivor")
    Island = create_type("Island")
    Food = create_type("Food")
    Water = create_type("Water")
    Fire = create_type("Fire")

    @predicate(Survivor, Island)
    def is_on(self, s, i):
        pass

    @predicate(Survivor, Water)
    def has_water(self, s, w):
        pass

    @predicate(Food, Island)
    def food_on(self, f, i):
        pass

    @predicate(Survivor, Food)
    def has_food(self, s, f):
        pass

    @predicate(Fire, Island)
    def fire_on(self, fj, i):
        pass

    @action(Survivor, Island, Water)
    def find_water(self, s, i, w):
        precond = [self.is_on(s, i)]
        effect = [self.has_water(s, w)]
        return precond, effect

    @action(Survivor, Fire, Island)
    def build_fire(self, s, fj, i):
        precond = [self.is_on(s, i)]
        effect = [self.fire_on(fj, i)]
        return precond, effect

    @action(Survivor, Island, Food)
    def get_food(self, s, i, f):
        precond = [self.is_on(s, i), self.food_on(f, i)]
        effect = [self.has_food(s, f)]
        return precond, effect

    @action(Survivor, Fire)
    def make_smoke_signal(self, s, fj):
        precond = [self.fire_on(fj, s)]
        effect = []
        return precond, effect
