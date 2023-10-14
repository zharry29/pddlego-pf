Sure, here is the PDDL problem file for task "eat fish".

```python
from py2pddl import goal, init

class JungleSurvivalProblem2(JungleSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.fish = JungleSurvivalDomain.Fish.create_objs([1])
        self.fire = JungleSurvivalDomain.Fire.create_objs([1])

    @init
    def init(self):
        at = [self.fish_exists(self.fish[1]), 
              self.fire_exists(self.fire[1])]
        return at

    @goal
    def goal(self):
        return [self.fish_exists(self.fish[1]), 
                self.fire_exists(self.fire[1])]
```

This problem file assumes that there is a fish and a fire available in the environment. The goal is to still have fish and fire after the "eat fish" action.