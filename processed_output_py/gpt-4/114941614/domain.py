
from py2pddl import Domain, create_type
from py2pddl import predicate, action

class JungleSurvivalDomain(Domain):

    Human = create_type("Human")
    Water = create_type("Water")
    Shelter = create_type("Shelter")

    @predicate(Human, Water)
    def has_water(self, h, w):
        """Defines whether the human has water"""

    @predicate(Human, Shelter)
    def at_shelter(self, h, s):
        """Defines where the human is at the shelter"""

    @action(Human)
    def find_water(self, h):
        precond = []
        effect = [self.has_water(h)]
        return precond, effect

    @action(Human, Water)
    def drink_water(self, h, w):
        precond = [self.has_water(h, w)]
        effect = [~self.has_water(h, w)]
        return precond, effect

    @action(Human)
    def find_shelter(self, h):
        precond = []
        effect = [self.at_shelter(h)]
        return precond, effect

    @action(Human, Shelter)
    def sleep_in_shelter(self, h, s):
        precond = [self.at_shelter(h, s)]
        effect = [~self.at_shelter(h, s)]
        return precond, effect
