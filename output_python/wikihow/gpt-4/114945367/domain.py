Sure, here it is:

```
from py2pddl import Domain, create_type
from py2pddl import predicate, action

class SurvivalDomain(Domain):

    Location = create_type("Location")
    Shelter = create_type("Shelter")
    Water = create_type("Water")
    Fire = create_type("Fire")

    @predicate(Shelter, Location)
    def shelter_at(self, s, l):
        pass

    @predicate(Water, Location)
    def water_at(self, w, l):
        pass

    @predicate(Water)
    def purified(self, w):
        pass

    @predicate(Fire, Location)
    def fire_at(self, f, l):
        pass

    @action(Shelter, Location)
    def build(self, s, l):
        precond = []
        effect = [self.shelter_at(s, l)]
        return precond, effect

    @action(Water, Location)
    def collect_water(self, w, l):
        precond = []
        effect = [self.water_at(w, l)]
        return precond, effect

    @action(Water)
    def purify(self, w):
        precond = [self.water_at(w)]
        effect = [self.purified(w)]
        return precond, effect

    @action(Fire, Location)
    def start_fire(self, f, l):
        precond = [self.shelter_at(l)]
        effect = [self.fire_at(f, l)]
        return precond, effect
```
