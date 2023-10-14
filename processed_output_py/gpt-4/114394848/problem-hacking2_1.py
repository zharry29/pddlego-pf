Python
class HackingProblem2(HackingDomain):

    def __init__(self):
        super().__init__()
        self.systems = HackingDomain.System.create_objs([2])
        self.ports = HackingDomain.Port.create_objs([1, 2])
        self.users = HackingDomain.User.create_objs([1])

    @init
    def init(self):
        at = [
            self.system_secured(self.systems[1]),
            self.system_secured(self.systems[2]),
        ]
        return at

    @goal
    def goal(self):
        return [
            self.backdoor_installed(self.users[1], self.systems[1]),
            self.backdoor_installed(self.users[1], self.systems[2]),
            ~self.system_secured(self.systems[1]),
            ~self.system_secured(self.systems[2])
        ]
