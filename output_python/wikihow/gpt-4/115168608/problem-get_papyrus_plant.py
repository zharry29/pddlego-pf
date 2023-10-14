Here's your PDDL problem with task 2: get papyrus plant.

```python
from py2pddl import goal, init

class GetPapyrusPlantProblem(PaperMakingDomain):

    def __init__(self):
        super().__init__()
        self.papyrusPlants = PaperMakingDomain.PapyrusPlant.create_objs(["plant1"])

    @init
    def init(self):
        return []

    @goal
    def goal(self):
        return [self.plant_available(p) for p in self.papyrusPlants]
```
