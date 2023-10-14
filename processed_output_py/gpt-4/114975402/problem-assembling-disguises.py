
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
