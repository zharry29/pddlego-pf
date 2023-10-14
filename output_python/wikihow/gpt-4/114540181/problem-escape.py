Sure, here it is:

```python
from py2pddl import goal, init

class EscapeProblem(JungleSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.people = JungleSurvivalDomain.Person.create_objs([1], prefix="p")
        self.places = JungleSurvivalDomain.Place.create_objs(["jungle", "village"], prefix="pl")

    @init
    def init(self):
        at = [self.person_at(self.people[1], self.places["jungle"])]
        return at

    @goal
    def goal(self):
        return [self.person_at(self.people[1], self.places["village"])]
```
