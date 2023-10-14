
from py2pddl import goal, init

class PapyrusProblem1(PapyrusDomain):

    def __init__(self):
        super().__init__()
        self.papyrus_plants = PapyrusDomain.Papyrus.create_objs([1], prefix="p")
        self.strips = PapyrusDomain.PapyrusStrips.create_objs(["dummy"])
        self.water = PapyrusDomain.Water.create_objs(["water"])

    @init
    def init(self):
        at = []
        return at

    @goal
    def goal(self):
        return [self.papyrus_in_water(self.water["water"], self.papyrus_plants[1])]
