Here is the problem file:

```python
from py2pddl import goal, init

class WoodsSurvivalProblem1(WoodsSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.waters = WoodsSurvivalDomain.Water.create_objs([1])

    @init
    def init(self):
        return []

    @goal
    def goal(self):
        return [self.has_water(self.waters[1])]
```