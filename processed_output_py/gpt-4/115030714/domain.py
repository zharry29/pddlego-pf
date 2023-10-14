
from py2pddl import Domain, create_type
from py2pddl import predicate, action

class PartyDomain(Domain):

    Food = create_type("Food")
    Drink = create_type("Drink")
    Decoration = create_type("Decoration")

    @predicate(Food)
    def food_prepared(self, f):
        pass

    @predicate(Drink)
    def drink_ready(self, d):
        pass

    @predicate(Decoration)
    def decoration_complete(self, d):
        pass

    @action(Food)
    def cook(self, f):
        precond = []
        effect = [self.food_prepared(f)]
        return precond, effect

    @action(Drink)
    def serve_drinks(self, d):
        precond = []
        effect = [self.drink_ready(d)]
        return precond, effect

    @action(Decoration)
    def decorate(self, d):
        precond = []
        effect = [self.decoration_complete(d)]
        return precond, effect
