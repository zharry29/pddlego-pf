Sure, here is the PDDL problem file in python format for creating a shelter:

```python
from py2pddl import goal, init

class SurvivalProblem_CreateShelter(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.shelters = SurvivalDomain.Shelter.create_objs([1], prefix="s")

    @init
    def init(self):
        at = []
        return at

    @goal
    def goal(self):
        return [self.has_shelter(self.shelters[1])] 
```