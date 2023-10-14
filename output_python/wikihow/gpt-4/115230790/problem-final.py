Sure, here is the requested problem file:

```python
from py2pddl import goal, init

class CometImpactProblem1(CometImpactDomain):

    def __init__(self):
        super().__init__()
        self.survivors = CometImpactDomain.Survivor.create_objs([1], prefix="s")
        self.locations = CometImpactDomain.Location.create_objs(["loc"], prefix="l")
        self.bunkers = CometImpactDomain.Bunker.create_objs(["bunker"], prefix="b")

    @init
    def init(self):
        at = [self.is_at(self.survivors[1], self.locations["loc"])]
        return at

    @goal
    def goal(self):
        return [self.is_at(self.survivors[1], self.bunkers["bunker"])]
```
This problem file handles the task "fina." The initial state is the survivor is at the location and the goal is for the survivor to be at the bunker.