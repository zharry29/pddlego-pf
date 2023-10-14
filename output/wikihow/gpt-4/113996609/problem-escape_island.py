Sure, using the `SurvivalDomain` class defined earlier, here is the PDDL problem file for the `scape islan` task:

```python
from py2pddl import goal, init

class EscapeIslandProblem(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.rafts = SurvivalDomain.Raft.create_objs([1], prefix="r")
        self.waters = SurvivalDomain.Water.create_objs([1], prefix="w")

    @init
    def init(self):
        return [self.water_is_clean(self.waters[1])]

    @goal
    def goal(self):
        return [self.island_is_escaped(self.rafts[1])]
```