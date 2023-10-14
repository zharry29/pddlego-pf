
from py2pddl import goal, init

class CoconutProblem1(CoconutDomain):

    def __init__(self):
        super().__init__()
        self.coconuts = CoconutDomain.Coconut.create_objs([1])
        self.glasses = CoconutDomain.Glass.create_objs([1])

    @init
    def init(self):
        at = [self.has_hole(self.coconuts[1])]
        return at

    @goal
    def goal(self):
        return [self.is_filled(self.coconuts[1], self.glasses[1])]
