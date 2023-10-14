Sure, here is the problem file for task 3: heal-old-man.

```python
from py2pddl import goal, init

class HealOldManProblem(WarSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.persons = WarSurvivalDomain.Person.create_objs(["man", "oldman"], prefix="p")
        self.supplies = WarSurvivalDomain.Supplies.create_objs(["medicine"], prefix="s")
        self.locations = WarSurvivalDomain.Location.create_objs(["home"], prefix="l")

    @init
    def init(self):
        at = [self.at(self.persons["man"], self.locations["home"]),
              self.is_alive(self.persons["oldman"]),
              self.has(self.persons["man"], self.supplies["medicine"])]
        return at

    @goal
    def goal(self):
        return [self.is_alive(self.persons["oldman"]),
                ~self.has(self.persons["man"], self.supplies["medicine"])]
```