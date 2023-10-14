Sure, here is the problem file 3:

```python
from py2pddl import goal, init

class PapyrusProblem3(PapyrusDomain):

    def __init__(self):
        super().__init__()
        self.papyrus_plants = PapyrusDomain.Papyrus.create_objs([1], prefix="p")
        self.strips = PapyrusDomain.PapyrusStrips.create_objs([1], prefix="ps")
        self.water = PapyrusDomain.Water.create_objs(["water"])

    @init
    def init(self):
        at = [self.strips_from_papyrus(self.strips[1])]
        return at

    @goal
    def goal(self):
        return [self.papyrus_strips_in_water(self.strips[1], self.water["water"])]
```
In this problem, we start with papyrus strips and we want to put the strips in water.