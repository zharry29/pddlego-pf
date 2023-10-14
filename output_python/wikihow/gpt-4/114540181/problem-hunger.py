Sure, here it is:

```python
from py2pddl import goal, init

class HungerProblem(JungleSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.people = JungleSurvivalDomain.Person.create_objs([1], prefix="p")
        self.foods = JungleSurvivalDomain.Food.create_objs(["fruit", "animal"], prefix="f")
        self.places = JungleSurvivalDomain.Place.create_objs(["jungle"], prefix="pl")

    @init
    def init(self):
        at = [self.person_at(self.people[1], self.places["jungle"]),
              ~self.has_food(self.foods["fruit"], self.people[1]),
              ~self.has_food(self.foods["animal"], self.people[1])]
        return at

    @goal
    def goal(self):
        return [self.has_food(self.foods["fruit"], self.people[1]),
                self.has_food(self.foods["animal"], self.people[1])]

```