Sure. Here is the third problem file for the Hacking domain, named as "hacking2 2":

```Python
class HackingProblem3(HackingDomain):

    def __init__(self):
        super().__init__()
        self.systems = HackingDomain.System.create_objs([2])
        self.ports = HackingDomain.Port.create_objs([1, 2])
        self.users = HackingDomain.User.create_objs([2])

    @init
    def init(self):
        at = [
            self.system_secured(self.systems[1]),
            self.system_secured(self.systems[2]),
            self.user_auth(self.users[1], self.systems[1])
        ]
        return at

    @goal
    def goal(self):
        return [
            self.backdoor_installed(self.users[2], self.systems[2])
        ]
```

This Python script for a PDDL problem assumes that there are two systems (System 1 and System 2), two ports (Port 1 and Port 2) and two users (User 1 and User 2). The User 1 has already authorization on System 1. The goal for User 2 is to install a backdoor in System 2. 
