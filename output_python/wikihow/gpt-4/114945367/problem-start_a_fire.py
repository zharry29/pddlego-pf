Sure, here it is:

```python
from py2pddl import goal, init

class SurvivalProblem4(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.fires = SurvivalDomain.Fire.create_objs([1], prefix="f")
        self.locations = SurvivalDomain.Location.create_objs(["l1"])

    @init
    def init(self):
        at = []
        return at

    @goal
    def goal(self):
        return [self.fire_at(self.fires[1], self.locations["l1"])]
```