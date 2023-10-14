Sure, here is the domain file:

```
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
```