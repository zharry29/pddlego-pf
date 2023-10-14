Sure, here is your requested domain file:

```python
from py2pddl import Domain, create_type
from py2pddl import predicate, action

class CometImpactDomain(Domain):

    Survivor = create_type("Survivor")
    Location = create_type("Location")
    Supplies = create_type("Supplies")
    Bunker = create_type("Bunker")

    @predicate(Survivor, Location)
    def is_at(self, s, l):
        """Survivor is at a location"""

    @predicate(Bunker)
    def has_bunker(self, b):
        """Location or Survivor has a bunker"""

    @predicate(Supplies)
    def has_supplies(self, s):
        """Survivor has sufficient supplies"""
    
    @action(Survivor, Location)
    def move(self, s, l):
        precond = [self.is_at(s, l)]
        effect = [~self.is_at(s,l), self.is_at(s,l)]
        return precond, effect

    @action(Survivor, Supplies)
    def gather_supplies(self, s, sp):
        precond = [self.is_at(s,l)]
        effect = [self.has_supplies(sp)]
        return precond, effect

    @action(Survivor, Bunker)
    def move_to_bunker(self, s, b):
        precond = [self.is_at(s,l), self.has_bunker(b)]
        effect = [~self.is_at(s,l), self.is_at(s,b)]
        return precond, effect
```