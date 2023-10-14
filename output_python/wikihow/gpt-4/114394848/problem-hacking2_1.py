Sure. Here is the second problem file for the Hacking domain, named as "hacking2 1":

```Python
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
```

This Python script for a PDDL problem assumes that there are two systems (System 1 and System 2), two ports (Port 1 and Port 2) and one hacker (User 1). The goal for the hacker is to install a backdoor in each system, leaving no system secure.