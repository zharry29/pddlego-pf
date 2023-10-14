from py2pddl import goal, init

from py2pddl import Domain, create_type
from py2pddl import predicate, action

class SurvivalDomain(Domain):

    Survivor = create_type("Survivor")
    Meat = create_type("Meat")
    Shelter = create_type("Shelter")
    Raft = create_type("Raft")

    @predicate(Meat)
    def raw_meat(self, m):
        pass

    @predicate(Meat)
    def cooked_meat(self, m):
        pass

    @predicate(Shelter)
    def has_shelter(self, s):
        pass

    @predicate(Raft)
    def has_raft(self, r):
        pass

    @action(Meat)
    def prepare_meat(self, m):
        precond = [self.raw_meat(m)]
        effect = [~self.raw_meat(m), self.cooked_meat(m)]
        return precond, effect

    @action(Shelter)
    def create_shelter(self, s):
        precond = []
        effect = [self.has_shelter(s)]
        return precond, effect

    @action(Raft)
    def build_raft(self, r):
        precond = []
        effect = [self.has_raft(r)]
        return precond, effect

from py2pddl import goal, init

class SurvivalProblem_PrepareMeat(SurvivalDomain):

    def __init__(self):
        super().__init__()
        self.meats = SurvivalDomain.Meat.create_objs([1], prefix="m")

    @init
    def init(self):
        at = [self.raw_meat(self.meats[1])]
        return at

    @goal
    def goal(self):
        return [self.cooked_meat(self.meats[1])]
