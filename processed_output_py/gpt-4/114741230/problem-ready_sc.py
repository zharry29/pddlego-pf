
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
