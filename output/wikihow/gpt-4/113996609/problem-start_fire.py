Sure, using the `SurvivalDomain` class defined earlier, here is the PDDL problem file for the `start fire` task:

```python
from py2pddl import goal, init

class StartFireProblem(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.fires = SurvivalDomain.Fire.create_objs([1], prefix="f")

    @init
    def init(self):
        return []

    @goal
    def goal(self):
        return [self.fire_is_started(self.fires[1])]
```