Sure, here it is:

```python
from py2pddl import Domain, create_type
from py2pddl import predicate, action

class JungleSurvivalDomain(Domain):

    Person = create_type("Person")
    Water = create_type("Water")
    Food = create_type("Food")
    Place = create_type("Place")
    Shelter = create_type("Shelter")

    @predicate(Person, Place)
    def person_at(self, p, pl):
        """Complete the method signature and specify
        the respective types in the decorator"""

    @predicate(Water, Person)
    def has_water(self, w, p):
        """Complete the method signature and specify
        the respective types in the decorator"""

    @predicate(Food, Person)
    def has_food(self, f, p):
        """Complete the method signature and specify
        the respective types in the decorator"""

    @predicate(Person, Shelter)
    def has_shelter(self, p, s):
        """Complete the method signature and specify
        the respective types in the decorator"""

    @predicate(Person)
    def is_safe(self, p):
        """Complete method signature"""

    @action(Person, Water)
    def drink(self, p, w):
        precond = [self.person_at(p), ~self.has_water(w, p)]
        effect = [self.has_water(w, p)]
        return precond, effect

    @action(Person, Food)
    def eat(self, p, f):
        precond = [self.person_at(p), ~self.has_food(f, p)]
        effect = [self.has_food(f, p)]
        return precond, effect
        
    @action(Person, Shelter)
    def build_shelter(self, p, s):
        precond = [self.person_at(p), ~self.has_shelter(p, s)]
        effect = [self.has_shelter(p, s)]
        return precond, effect

    @action(Person, Place)
    def move(self, p, pl):
        precond = [~self.person_at(p, pl)]
        effect = [self.person_at(p, pl)]
        return precond, effect

    @action(Person)
    def escape(self, p):
        precond = [self.is_safe(p)]
        effect = [~self.person_at(p)]
        return precond, effect
```