Sure, here is the problem file 2:

```python
from py2pddl import goal, init

class PapyrusProblem2(PapyrusDomain):

    def __init__(self):
        super().__init__()
        self.papyrus_plants = PapyrusDomain.Papyrus.create_objs([1], prefix="p")
        self.strips = PapyrusDomain.PapyrusStrips.create_objs([1], prefix="ps")
        self.water = PapyrusDomain.Water.create_objs(["water"])

    @init
    def init(self):
        at = [self.papyrus_in_water(self.water["water"], self.papyrus_plants[1])]
        return at

    @goal
    def goal(self):
        return [self.strips_from_papyrus(self.strips[1])]
```
In this problem, we start with a papyrus plant in water and we want to get papyrus strips from the plant.