Sure, Here's your third problem file:

```python
class DesertIslandProblem3(DesertIslandDomain):

    def __init__(self):
        super().__init__()
        self.fire1 = DesertIslandDomain.Fire.create_objs([1], prefix="f")

    @init
    def init(self):
        return []

    @goal
    def goal(self):
        return [self.has_fire(self.fire1[1])]
```