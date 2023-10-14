Here's your PDDL domain file:

```python
from py2pddl import Domain, create_type
from py2pddl import predicate, action

class PaperMakingDomain(Domain):

    Material = create_type("Material")
    PapyrusPlant = create_type("PapyrusPlant")
    PapyrusPaper = create_type("PapyrusPaper")

    @predicate(Material)
    def material_available(self, m):
        pass

    @predicate(PapyrusPlant)
    def plant_available(self, p):
        pass

    @predicate(PapyrusPaper)
    def made_paper(self, pp):
        pass

    @action(Material)
    def get_materials(self, m):
        precond = [~self.material_available(m)]
        effect = [self.material_available(m)]
        return precond, effect

    @action(PapyrusPlant)
    def get_papyrus_plant(self, p):
        precond = [~self.plant_available(p)]
        effect = [self.plant_available(p)]
        return precond, effect

    @action(Material,PapyrusPlant,PapyrusPaper)
    def make_papyrus(self, m, p, pp):
        precond = [self.material_available(m), self.plant_available(p), ~self.made_paper(pp)]
        effect = [self.made_paper(pp)]
        return precond, effect
```
This domain contains three object types `Material`, `PapyrusPlant`, and `PapyrusPaper`. For each type, there's a predicate to check if the object is available or made. 

It also consists of three actions: `get_materials`, `get_papyrus_plant`, and `make_papyrus`. Each action has preconditions and effects defined according to how it changes the state of its involved objects.