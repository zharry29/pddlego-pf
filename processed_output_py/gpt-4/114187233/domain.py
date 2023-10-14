
from py2pddl import Domain, create_type
from py2pddl import predicate, action

class CoconutDomain(Domain):

    Coconut = create_type("Coconut")

    @predicate(Coconut)
    def is_ripe(self, c):
        pass

    @predicate(Coconut)
    def is_wrapped(self, c):
        pass

    @predicate(Coconut)
    def is_drained(self, c):
        pass

    @predicate(Coconut)
    def is_opened(self, c):
        pass

    @predicate(Coconut)
    def juice_extracted(self, c):
        pass

    @predicate(Coconut)
    def meat_extracted(self, c):
        pass

    @action(Coconut)
    def wrap_coconut(self, c):
        precond = [self.is_ripe(c)]
        effect = [self.is_wrapped(c)]
        return precond, effect

    @action(Coconut)
    def break_coconut(self, c):
        precond = [self.is_wrapped(c)]
        effect = [self.is_opened(c)]
        return precond, effect

    @action(Coconut)
    def drain_coconut(self, c):
        precond = [self.is_opened(c)]
        effect = [self.is_drained(c)]
        return precond, effect

    @action(Coconut)
    def extract_juice(self, c):
        precond = [self.is_drained(c)]
        effect = [self.juice_extracted(c)]
        return precond, effect

    @action(Coconut)
    def extract_meat(self, c):
        precond = [self.is_drained(c)]
        effect = [self.meat_extracted(c)]
        return precond, effect
