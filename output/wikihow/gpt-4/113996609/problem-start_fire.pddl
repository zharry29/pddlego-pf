Sure, here is the problems file for the task 'start fire':

```python
from py2pddl import goal, init

class SurvivalProblem4(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.fires = SurvivalDomain.Fire.create_objs([1], prefix="f")

    @init
    def init(self):
        at = []
        return at

    @goal
    def goal(self):
        return [self.fire_started(self.fires[0])]
```