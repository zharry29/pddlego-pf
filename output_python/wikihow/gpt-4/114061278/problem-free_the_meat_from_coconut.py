Here is the Python code for the second problem file:

```python
from py2pddl import goal, init

class CoconutProblem2(CoconutDomain):

    def __init__(self):
        super().__init__()
        self.coconuts = CoconutDomain.Coconut.create_objs([1])

    @init
    def init(self):
        at = [self.has_fibre(self.coconuts[1])]
        return at

    @goal
    def goal(self):
        return [self.is_meat_free(self.coconuts[1])]
```