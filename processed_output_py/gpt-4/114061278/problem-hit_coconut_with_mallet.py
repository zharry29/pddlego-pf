
from py2pddl import goal, init

class CoconutProblem3(CoconutDomain):

    def __init__(self):
        super().__init__()
        self.coconuts = CoconutDomain.Coconut.create_objs([1])
        self.towels = CoconutDomain.Towel.create_objs([1])

    @init
    def init(self):
        at = [self.is_wrapped(self.towels[1])]
        return at

    @goal
    def goal(self):
        return [self.has_hole(self.coconuts[1])]
