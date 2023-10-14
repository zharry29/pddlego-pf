Sure. Here's a basic PDDL problem definition for the "drink water" task.

```python
from py2pddl import goal, init

class JungleSurvivalProblem1(JungleSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.water = JungleSurvivalDomain.Water.create_objs([1])
        self.container = JungleSurvivalDomain.Container.create_objs([1], prefix="c")

    @init
    def init(self):
        at = [self.water_exists(self.water[1]), 
              self.container_exists(self.container[1])]
        return at

    @goal
    def goal(self):
        return [self.water_exists(self.water[1]), 
                self.container_exists(self.container[1])]
```
This assumes that there is water and a container available in the environment. The goal is to still have water and container after the "drink water" action.