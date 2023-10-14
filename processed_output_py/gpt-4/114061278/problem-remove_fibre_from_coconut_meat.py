
from py2pddl import goal, init

class CoconutProblem5(CoconutDomain):

    def __init__(self):
        super().__init__()
        self.coconuts = CoconutDomain.Coconut.create_objs([1])

    @init
    def init(self):
        at = [self.has_fibre(self.coconuts[1])]
        return at

    @goal
    def goal(self):
        return [~self.has_fibre(self.coconuts[1])]
