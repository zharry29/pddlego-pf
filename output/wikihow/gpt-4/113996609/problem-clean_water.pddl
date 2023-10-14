Here is the problems file for the task 'clean water':

```python
from py2pddl import goal, init

class SurvivalProblem2(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.waters = SurvivalDomain.Water.create_objs([1], prefix="w")

    @init
    def init(self):
        at = []
        return at

    @goal
    def goal(self):
        return [self.water_clean(self.waters[0])]
```