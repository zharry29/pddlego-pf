Sure, here is the generated problem file for task 1: fill-inventory.

```python
from py2pddl import goal, init

class FillInventoryProblem(WarSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.people = WarSurvivalDomain.Person.create_objs([1], prefix="p")
        self.supplies = WarSurvivalDomain.Supplies.create_objs(["food", "medicine"], prefix="s")
        self.locations = WarSurvivalDomain.Location.create_objs(["home", "store"], prefix="l")

    @init
    def init(self):
        at = [self.at(self.people[1], self.locations["home"]),
              self.exists(self.supplies["food"]),
              self.exists(self.supplies["medicine"])]
        return at

    @goal
    def goal(self):
        return [self.has(self.people[1], self.supplies["food"]),
                self.has(self.people[1], self.supplies["medicine"])]
```
