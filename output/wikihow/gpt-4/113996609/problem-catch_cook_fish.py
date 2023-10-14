Sure, using the `SurvivalDomain` class defined earlier, here is the PDDL problem file for the `catch cook fish` task:

```python
from py2pddl import goal, init

class CatchCookFishProblem(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.fishes = SurvivalDomain.Fish.create_objs([1], prefix="f")
        self.fires = SurvivalDomain.Fire.create_objs([1], prefix="fi")

    @init
    def init(self):
        at = [self.fire_is_started(self.fires[1])]
        return at

    @goal
    def goal(self):
        return [self.fish_is_cooked(self.fishes[1])]
```