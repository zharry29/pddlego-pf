```
from py2pddl import goal, init

class EMPProblem3(EMPDomain):

    def __init__(self):
        super().__init__()
        self.persons = EMPDomain.Person.create_objs([1], prefix="p")
        self.places = EMPDomain.Place.create_objs(["home"], prefix="a")

    @init
    def init(self):
        at = [self.home(self.persons[1], self.places["home"]),
              self.has_water(self.persons[1]),
              self.radio_on(self.persons[1])]
        return at

    @goal
    def goal(self):
        return [self.prepared_for_attack(self.persons[1])]
```