```
from py2pddl import goal, init

class EMPProblem5(EMPDomain):

    def __init__(self):
        super().__init__()
        self.persons = EMPDomain.Person.create_objs([1], prefix="p")
        self.places = EMPDomain.Place.create_objs(["home"], prefix="a")

    @init
    def init(self):
        at = [self.home(self.persons[1], self.places["home"])]
        return at

    @goal
    def goal(self):
        return [self.radio_on(self.persons[1])]
```