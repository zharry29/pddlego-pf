from py2pddl import goal, init

from py2pddl import Domain, create_type
from py2pddl import predicate, action

class DetectiveKitDomain(Domain):

    Bag = create_type("Bag")
    Alias = create_type("Alias")
    Disguise = create_type("Disguise")
    Stationery = create_type("Stationery")
    FingerprintingKit = create_type("FingerprintingKit")
    WalkieTalkie = create_type("WalkieTalkie")

    @predicate(Disguise, Alias)
    def disguise_for_alias(self, d, a):
        pass

    @predicate(Bag, Disguise)
    def disguise_in_bag(self, b, d):
        pass

    @predicate(Bag, Stationery)
    def stationery_in_bag(self, b, s):
        pass

    @predicate(Bag, FingerprintingKit)
    def fingerprinting_kit_in_bag(self, b, f):
        pass
    
    @predicate(Bag, WalkieTalkie)
    def walkie_talkie_in_bag(self, b, w):
        pass

    @action(Disguise, Alias)
    def assemble_disguise(self, d, a):
        precond = []
        effect = [self.disguise_for_alias(d, a)]
        return precond, effect

    @action(Bag, Disguise)
    def add_disguise_to_bag(self, b, d):
        precond = [self.disguise_for_alias(d, a) for a in self.aliases]
        effect = [self.disguise_in_bag(b, d)]
        return precond, effect

    @action(Bag, Stationery)
    def add_stationery_to_bag(self, b, s):
        precond = []
        effect = [self.stationery_in_bag(b, s)]
        return precond, effect

    @action(Bag, FingerprintingKit)
    def add_fingerprinting_kit_to_bag(self, b, f):
        precond = []
        effect = [self.fingerprinting_kit_in_bag(b, f)]
        return precond, effect

    @action(Bag, WalkieTalkie)
    def add_walkie_talkie_to_bag(self, b, w):
        precond = []
        effect = [self.walkie_talkie_in_bag(b, w)]
        return precond, effect

from py2pddl import goal, init

class AssemblingDisguisesProblem(DetectiveKitDomain):

    def __init__(self):
        super().__init__()
        self.disguises = DetectiveKitDomain.Disguise.create_objs(["football_player", "grandma", "artist"], prefix="d")
        self.aliases = DetectiveKitDomain.Alias.create_objs(["alias1", "alias2", "alias3"], prefix="a")

    @init
    def init(self):
        at = []
        return at

    @goal
    def goal(self):
        return [self.disguise_for_alias(self.disguises["football_player"], self.aliases["alias1"]),
                self.disguise_for_alias(self.disguises["grandma"], self.aliases["alias2"]),
                self.disguise_for_alias(self.disguises["artist"], self.aliases["alias3"])]
