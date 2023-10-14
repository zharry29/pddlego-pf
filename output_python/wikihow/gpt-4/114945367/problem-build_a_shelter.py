Sure, here it is:

```python
from py2pddl import goal, init

class SurvivalProblem1(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.shelters = SurvivalDomain.Shelter.create_objs([1], prefix="s")
        self.locations = SurvivalDomain.Location.create_objs(["l1"])

    @init
    def init(self):
        at = []
        return at

    @goal
    def goal(self):
        return [self.shelter_at(self.shelters[1], self.locations["l1"])]
```
