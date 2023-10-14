Sure, here is the PDDL problem file in python format for preparing meat:

```python
from py2pddl import goal, init

class SurvivalProblem_PrepareMeat(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.meats = SurvivalDomain.Meat.create_objs([1], prefix="m")

    @init
    def init(self):
        at = [self.raw_meat(self.meats[1])]
        return at

    @goal
    def goal(self):
        return [self.cooked_meat(self.meats[1])]
```