
from py2pddl import goal, init

class InvitePlayersProblem(SecretSocietyDomain):

    def __init__(self):
        super().__init__()
        self.secret = SecretSocietyDomain.Secret.create_objs(["none"])
        self.society = SecretSocietyDomain.Society.create_objs(["ve"])
        self.friends = SecretSocietyDomain.Friend.create_objs(["founder", "player1", "player2", "player3", "player4", "player5"])

    @init
    def init(self):
        at = [self.member_of(self.friends["founder"], self.society["ve"])]
        return at

    @goal
    def goal(self):
        return [self.member_of(self.friends["player1"], self.society["ve"]),
                self.member_of(self.friends["player2"], self.society["ve"]),
                self.member_of(self.friends["player3"], self.society["ve"]),
                self.member_of(self.friends["player4"], self.society["ve"]),
                self.member_of(self.friends["player5"], self.society["ve"])]
