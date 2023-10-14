
from py2pddl import goal, init

class MakePapyrusProblem(PaperMakingDomain):

    def __init__(self):
        super().__init__()
        self.materials = PaperMakingDomain.Material.create_objs(["water", "knife", "linen_cloth", "wooden_board"])
        self.papyrusPlants = PaperMakingDomain.PapyrusPlant.create_objs(["plant1"])
        self.papyrusPapers = PaperMakingDomain.PapyrusPaper.create_objs(["paper1"])

    @init
    def init(self):
        at_materials = [self.material_available(m) for m in self.materials]
        at_papyrusPlants = [self.plant_available(p) for p in self.papyrusPlants]
        return at_materials + at_papyrusPlants

    @goal
    def goal(self):
        return [self.made_paper(pp) for pp in self.papyrusPapers]
