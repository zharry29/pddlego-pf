Here is the PDDL problem file 1 in python format:

```python
from py2pddl import goal, init

class CreateCultProblem(SecretSocietyDomain):

    def __init__(self):
        super().__init__()
        self.society = SecretSocietyDomain.Society.create_objs(["cult"])
        self.friends = SecretSocietyDomain.Friend.create_objs(["founder"])

    @init
    def init(self):
        at = [self.member_of(self.friends["founder"], self.society["cult"])]
        return at

    @goal
    def goal(self):
        return [self.has_secret(self.society["cult"])]
```