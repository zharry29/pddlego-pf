from py2pddl import goal, init

from py2pddl import Domain, create_type
from py2pddl import predicate, action

class PapyrusDomain(Domain):

    Papyrus = create_type("Papyrus")
    PapyrusStrips = create_type("PapyrusStrips")
    Water = create_type("Water")

    @predicate(Water, Papyrus)
    def papyrus_in_water(self, w, p):
        pass

    @predicate(PapyrusStrips)
    def strips_from_papyrus(self, ps):
        pass

    @predicate(PapyrusStrips, Water)
    def papyrus_strips_in_water(self, ps, w):
        pass

    @action(Papyrus)
    def get_papyrus(self, p):
        precond = []
        effect = [self.papyrus_in_water(self.Water["water"], p)]
        return precond, effect

    @action(Papyrus)
    def get_strips(self, p):
        precond = [self.papyrus_in_water(self.Water["water"], p)]
        effect = [~self.papyrus_in_water(self.Water["water"], p), self.strips_from_papyrus(self.PapyrusStrips[str(p) + "_strips"])]
        return precond, effect

    @action(PapyrusStrips)
    def cess_strips(self, ps):
        precond = [self.strips_from_papyrus(ps)]
        effect = [~self.strips_from_papyrus(ps), self.papyrus_strips_in_water(ps, self.Water["water"])]
        return precond, effect

from py2pddl import goal, init

class PapyrusProblem2(PapyrusDomain):

    def __init__(self):
        super().__init__()
        self.papyrus_plants = PapyrusDomain.Papyrus.create_objs([1], prefix="p")
        self.strips = PapyrusDomain.PapyrusStrips.create_objs([1], prefix="ps")
        self.water = PapyrusDomain.Water.create_objs(["water"])

    @init
    def init(self):
        at = [self.papyrus_in_water(self.water["water"], self.papyrus_plants[1])]
        return at

    @goal
    def goal(self):
        return [self.strips_from_papyrus(self.strips[1])]
