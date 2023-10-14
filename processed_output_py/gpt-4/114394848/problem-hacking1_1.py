Python
from py2pddl import goal, init

class HackingProblem1(HackingDomain):

    def __init__(self):
        super().__init__()
        self.systems = HackingDomain.System.create_objs([1])
        self.ports = HackingDomain.Port.create_objs([1])
        self.users = HackingDomain.User.create_objs([1])

    @init
    def init(self):
        at = [
            self.system_secured(self.systems[1]),
        ]
        return at

    @goal
    def goal(self):
        return [
            self.backdoor_installed(self.users[1], self.systems[1]),
            ~self.system_secured(self.systems[1])
        ]
