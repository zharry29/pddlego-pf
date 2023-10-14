from py2pddl import goal, init

from py2pddl import Domain, create_type
from py2pddl import predicate, action

class SurvivalIslandDomain(Domain):

    Person = create_type("Person")
    
    @predicate(Person)
    def has_fishing_gear(self, p):
        pass

    @predicate(Person)
    def has_fire(self, p):
        pass

    @predicate(Person)
    def has_clean_water(self, p):
        pass

    @predicate(Person)
    def is_on_island(self, p):
        pass

    @action(Person)
    def catch_cook_fish(self, p):
        precond = [self.has_fishing_gear(p), self.has_fire(p)]
        effect = []
        return precond, effect

    @action(Person)
    def clean_water(self, p):
        precond = [self.is_on_island(p)]
        effect = [self.has_clean_water(p)]
        return precond, effect

    @action(Person)
    def escape_island(self, p):
        precond = [self.is_on_island(p)]
        effect = [~self.is_on_island(p)]
        return precond, effect

    @action(Person)
    def start_fire(self, p):
        precond = [self.is_on_island(p)]
        effect = [self.has_fire(p)]
        return precond, effect

class SurvivalIslandProblem4(SurvivalIslandDomain):

    def __init__(self):
        super().__init__()
        self.people = SurvivalIslandDomain.Person.create_objs([1], prefix="p")

    @init
    def init(self):
        at = [self.is_on_island(self.people[1])]
        return at

    @goal
    def goal(self):
        return [self.has_fire(self.people[1])]
