Sure, here is problem file 2: "assembling a detective kit"

```python
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
```