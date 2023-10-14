Sure, using the `SurvivalDomain` class defined earlier, here is the PDDL problem file for the `clean water` task:

```python
from py2pddl import goal, init

class CleanWaterProblem(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.waters = SurvivalDomain.Water.create_objs([1], prefix="w")

    @init
    def init(self):
        return []

    @goal
    def goal(self):
        return [self.water_is_clean(self.waters[1])]
```