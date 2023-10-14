```python
from py2pddl import goal, init

class PartyProblem1(PartyDomain):

    def __init__(self):
        super().__init__()
        self.foods = PartyDomain.Food.create_objs(["sushi", "teriyaki", "fried_rice"], prefix="f")

    @init
    def init(self):
        at = []
        return at

    @goal
    def goal(self):
        return [self.food_prepared(self.foods["sushi"]),
                self.food_prepared(self.foods["teriyaki"]),
                self.food_prepared(self.foods["fried_rice"])]
```