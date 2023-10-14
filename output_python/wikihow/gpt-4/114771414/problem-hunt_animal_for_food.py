Sure, here is your second problem file.

```python
class DesertIslandProblem2(DesertIslandDomain):

    def __init__(self):
        super().__init__()
        self.person = DesertIslandDomain.Person.create_objs([1], prefix="p")
        self.animal = DesertIslandDomain.Animal.create_objs(["foo"], prefix="a")

    @init
    def init(self):
        return []

    @goal
    def goal(self):
        return [self.has_food(self.person[1], self.animal["foo"])]
```