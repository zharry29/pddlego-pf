Sure, here's the PDDL problem file for the task of enforcing the basement:

```python
from py2pddl import goal, init

class EnforceBasementProblem(NuclearSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.shelters = NuclearSurvivalDomain.Shelter.create_objs([1], prefix="s")
        self.basements = NuclearSurvivalDomain.Basement.create_objs([1], prefix="b")

    @init
    def init(self):
        at = [self.shelter_at(self.shelters[1], self.basements[1])]
        return at

    @goal
    def goal(self):
        return [self.inforced_shelter(self.shelters[1])]
```
