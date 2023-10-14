from py2pddl import goal, init

from py2pddl import Domain, create_type
from py2pddl import predicate, action

class DesertIslandDomain(Domain):

    Person = create_type("Person")
    Shelter = create_type("Shelter")
    Animal = create_type("Animal")
    Fire = create_type("Fire")

    @predicate(Person, Shelter)
    def has_shelter(self, p, s):
        pass

    @predicate(Fire)
    def has_fire(self, f):
        pass
        
    @predicate(Person, Animal)
    def has_food(self, p, a):
        pass

    @action(Person, Shelter)
    def build_shelter(self, p, s):
        precond = []
        effect = [self.has_shelter(p, s)]
        return precond, effect

    @action(Person, Animal)
    def hunt(self, p, a):
        precond = []
        effect = [self.has_food(p, a)]
        return precond, effect
        
    @action(Fire)
    def make_fire(self, f):
        precond = []
        effect = [self.has_fire(f)]
        return precond, effect

from py2pddl import goal, init

class DesertIslandProblem1(DesertIslandDomain):

    def __init__(self):
        super().__init__()
        self.person = DesertIslandDomain.Person.create_objs([1], prefix="p")
        self.shelter = DesertIslandDomain.Shelter.create_objs(["sturdyShelter"], prefix="s")

    @init
    def init(self):
        return []

    @goal
    def goal(self):
        return [self.has_shelter(self.person[1], self.shelter["sturdyShelter"])]
