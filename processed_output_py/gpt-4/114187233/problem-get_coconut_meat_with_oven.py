
from py2pddl import goal, init

class CoconutMeatOvenProblem(CoconutDomain):

    def __init__(self):
        super().__init__()
        self.coconuts = CoconutDomain.Coconut.create_objs([1], prefix="c")

    @init
    def init(self):
        at = [self.is_ripe(self.coconuts[1])]
        return at

    @goal
    def goal(self):
        return [self.meat_extracted(self.coconuts[1]), self.is_opened(self.coconuts[1])]
