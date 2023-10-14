Sure, here is the problem file for task 2: find-shelter.

```python
from py2pddl import goal, init

class FindShelterProblem(WarSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.people = WarSurvivalDomain.Person.create_objs([1], prefix="p")
        self.shelters = WarSurvivalDomain.Shelter.create_objs(["shelter"], prefix="s")
        self.locations = WarSurvivalDomain.Location.create_objs(["home", "wilderness"], prefix="l")

    @init
    def init(self):
        at = [self.at(self.people[1], self.locations["home"])]
        return at

    @goal
    def goal(self):
        return [self.at(self.people[1], self.shelters["shelter"])]
```