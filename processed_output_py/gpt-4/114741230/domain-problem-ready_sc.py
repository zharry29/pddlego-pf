from py2pddl import goal, init

from py2pddl import Domain, create_type
from py2pddl import predicate, action

class SecretSocietyDomain(Domain):

    Society = create_type("Society")
    Secret = create_type("Secret")
    Friend = create_type("Friend")

    @predicate(Friend, Society)
    def member_of(self, f, s):
        pass

    @predicate(Society, Secret)
    def has_secret(self, s, se):
        pass

    @predicate(Friend, Secret)
    def knows(self, f, se):
        pass

    @action(Society)
    def create_society(self, s):
        precond = []
        effect = []
        return precond, effect

    @action(Society, Secret)
    def add_secret(self, s, se):
        precond = [self.member_of("founder", s)]
        effect = [self.has_secret(s, se)]
        return precond, effect

    @action(Friend, Society)
    def invite_member(self, f, s):
        precond = [self.has_secret(s)]
        effect = [self.member_of(f, s)]
        return precond, effect

    @action(Friend, Secret)
    def reveal_secret(self, f, se):
        precond = [self.member_of(f), self.has_secret(se)]
        effect = [self.knows(f, se)]
        return precond, effect

from py2pddl import goal, init

class AdySecretProblem(SecretSocietyDomain):

    def __init__(self):
        super().__init__()
        self.secret = SecretSocietyDomain.Secret.create_objs(["sc"])
        self.society = SecretSocietyDomain.Society.create_objs(["ady"])
        self.friends = SecretSocietyDomain.Friend.create_objs(["founder"])

    @init
    def init(self):
        at = [self.member_of(self.friends["founder"], self.society["ady"])]
        return at

    @goal
    def goal(self):
        return [self.has_secret(self.society["ady"], self.secret["sc"])]
