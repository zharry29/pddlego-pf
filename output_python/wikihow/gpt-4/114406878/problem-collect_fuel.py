Here is the problem file:

```python
from py2pddl import goal, init

class WoodsSurvivalProblem3(WoodsSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.fuels = WoodsSurvivalDomain.Fuel.create_objs([1])

    @init
    def init(self):
        return []

    @goal
    def goal(self):
        return [self.has_fuel(self.fuels[1])]
```