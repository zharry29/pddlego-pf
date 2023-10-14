from py2pddl import goal, init

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

from py2pddl import goal, init

class FindShelterProblem(WarSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.people = WarSurvivalDomain.Person.create_objs([1], prefix="p")
        self.shelters = WarSurvivalDomain.Shelter.create_objs(["shelter"], prefix="s")
        self.locations = WarSurvivalDomain.Location.create_objs(["home", "wilderness"], prefix="l")

    @init
    def init(self):
        at = [self.at(self.people[1], self.locations["home"])]
        return at

    @goal
    def goal(self):
        return [self.at(self.people[1], self.shelters["shelter"])]
