
from py2pddl import goal, init

class PapyrusSoakingAndFlatteningProblem(PapyrusMakingDomain):

    def __init__(self):
        super().__init__()
        self.basematerial = PapyrusMakingDomain.BaseMaterial.create_objs([1])

    @init
    def init(self):
        at = []
        return at

    @goal
    def goal(self):
        return [self.material_soaked(self.basematerial[1]), self.material_flattened(self.basematerial[1])]
