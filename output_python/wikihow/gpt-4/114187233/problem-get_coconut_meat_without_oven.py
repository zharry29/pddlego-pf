Sure, here is the second problem file in python format:

```python
from py2pddl import goal, init

class CoconutMeatProblem(CoconutDomain):

    def __init__(self):
        super().__init__()
        self.coconuts = CoconutDomain.Coconut.create_objs([1], prefix="c")

    @init
    def init(self):
        at = [self.is_ripe(self.coconuts[1])]
        return at

    @goal
    def goal(self):
        return [self.meat_extracted(self.coconuts[1])]
```
This problem file is about extracting the meat from a ripe coconut without an oven.
