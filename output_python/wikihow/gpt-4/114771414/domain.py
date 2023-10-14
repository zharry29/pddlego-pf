Sure, here is your domain file.

```python
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
```