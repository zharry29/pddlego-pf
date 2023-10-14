Here is the problem file for task 1: get materials.

```python
from py2pddl import goal, init

class GetMaterialsProblem(PaperMakingDomain):

    def __init__(self):
        super().__init__()
        self.materials = PaperMakingDomain.Material.create_objs(["water", "knife", "linen_cloth", "wooden_board"])

    @init
    def init(self):
        return []

    @goal
    def goal(self):
        return [self.material_available(m) for m in self.materials]
```
