Of course, here is the problems file for the task 'catch cook fish':

```python
from py2pddl import goal, init

class SurvivalProblem1(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.fishes = SurvivalDomain.Fish.create_objs([1], prefix="f")

    @init
    def init(self):
        at = []
        return at

    @goal
    def goal(self):
        return [self.fish_cooked(self.fishes[0])]
```
