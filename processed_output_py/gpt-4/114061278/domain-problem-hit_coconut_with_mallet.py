from py2pddl import goal, init

from py2pddl import Domain, create_type
from py2pddl import predicate, action

class CoconutDomain(Domain):

    Coconut = create_type("Coconut")
    Glass = create_type("Glass")
    Towel = create_type("Towel")

    @predicate(Coconut)
    def has_hole(self, c):
        """Complete the method signature and specify
        the respective types in the decorator"""

    @predicate(Coconut)
    def has_fibre(self, c):
        """Complete the method signature and specify
        the respective types in the decorator"""

    @predicate(Towel)
    def is_wrapped(self, t):
        """Complete the method signature and specify
        the respective types in the decorator"""

    @predicate(Coconut, Glass)
    def is_filled(self, c, g):
        """Complete the method signature and specify
        the respective types in the decorator"""

    @predicate(Coconut)
    def is_meat_free(self, c):
        """Complete the method signature and specify
        the respective types in the decorator"""

    @action(Glass)
    def fill_glass(self, g):
        precond = [self.has_hole(c)]
        effect = [self.is_filled(g)]
        return precond, effect

    @action(Coconut)
    def remove_fibre(self, c):
        precond = [self.has_fibre(c)]
        effect = [~self.has_fibre(c), self.is_meat_free(c)]
        return precond, effect

    @action(Coconut)
    def hit_coconut(self, c):
        precond = [self.is_wrapped(t)]
        effect = [self.has_hole(c)]
        return precond, effect

    @action(Coconut)
    def wrap_coconut(self, c):
        precond = [~self.is_wrapped(t)]
        effect = [self.is_wrapped(t)]
        return precond, effect

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
