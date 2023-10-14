
from py2pddl import Domain, create_type
from py2pddl import predicate, action

class EMPDomain(Domain):

    Place = create_type("Place")
    Person = create_type("Person")

    @predicate(Person, Place)
    def person_at(self, p, a):
        pass

    @predicate(Person, Place)
    def home(self, p, a):
        pass

    @predicate(Person)
    def has_water(self, p):
        pass
      
    @predicate(Person)
    def radio_on(self, p):
        pass
      
    @predicate(Person)
    def prepared_for_attack(self, p):
        pass

    @action(Person, Place)
    def get_home(self, p, a):
        precond = [self.person_at(p, a)]
        effect = [~self.person_at(p, a), self.home(p, a)]
        return precond, effect

    @action(Person)
    def collect_water(self, p):
        precond = [self.person_at(p)]
        effect = [self.has_water(p)]
        return precond, effect

    @action(Person)
    def turn_on_radio(self, p):
        precond = [self.home(p)]
        effect = [self.radio_on(p)]
        return precond, effect

    @action(Person)
    def prep_for_attack(self, p):
        precond = [self.radio_on(p), self.has_water(p)]
        effect = [self.prepared_for_attack(p)]
        return precond, effect
