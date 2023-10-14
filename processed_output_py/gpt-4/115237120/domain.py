
from py2pddl import Domain, create_type
from py2pddl import predicate, action

class WarSurvivalDomain(Domain):

    Person = create_type("Person")
    Shelter = create_type("Shelter")
    Supplies = create_type("Supplies")
    Location = create_type("Location")
  
    @predicate(Person)
    def is_alive(self, p):
        pass

    @predicate(Person, Location)
    def at(self, p, l):
        pass

    @predicate(Supplies)
    def exists(self, s):
        pass

    @predicate(Person, Supplies)
    def has(self, p, s):
        pass

    @action(Person, Location)
    def move(self, p, l):
        precond = [self.is_alive(p)]
        effect = [self.at(p, l)]
        return precond, effect

    @action(Person, Supplies)
    def pickup(self, p, s):
        precond = [self.is_alive(p), self.exists(s)]
        effect = [self.has(p, s)]
        return precond, effect

    @action(Person, Supplies)
    def use(self, p, s):
        precond = [self.is_alive(p), self.has(p, s)]
        effect = [~self.has(p, s)]
        return precond, effect
