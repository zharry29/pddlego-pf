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

class AssemblingDetectiveKitProblem(DetectiveKitDomain):

    def __init__(self):
        super().__init__()
        self.bag = DetectiveKitDomain.Bag.create_objs(["duffel"], prefix="b")
        self.disguises = DetectiveKitDomain.Disguise.create_objs(["football_player", "grandma", "artist"], prefix="d")
        self.stationeries = DetectiveKitDomain.Stationery.create_objs(["notebook", "pen"], prefix="s")
        self.fingerprinting_kits = DetectiveKitDomain.FingerprintingKit.create_objs(["kit1"], prefix="f")
        self.walkie_talkies = DetectiveKitDomain.WalkieTalkie.create_objs(["walkie1"], prefix="w")

    @init
    def init(self):
        at = [self.disguise_for_alias(self.disguises[d], self.aliases[a]) for d, a in zip(["football_player", "grandma", "artist"], ["alias1", "alias2", "alias3"])]
        return at

    @goal
    def goal(self):
        return [self.disguise_in_bag(self.bag["duffel"], self.disguises["football_player"]),
                self.disguise_in_bag(self.bag["duffel"], self.disguises["grandma"]),
                self.disguise_in_bag(self.bag["duffel"], self.disguises["artist"]),
                self.stationery_in_bag(self.bag["duffel"], self.stationeries["notebook"]),
                self.stationery_in_bag(self.bag["duffel"], self.stationeries["pen"]),
                self.fingerprinting_kit_in_bag(self.bag["duffel"], self.fingerprinting_kits["kit1"]),
                self.walkie_talkie_in_bag(self.bag["duffel"], self.walkie_talkies["walkie1"])]
