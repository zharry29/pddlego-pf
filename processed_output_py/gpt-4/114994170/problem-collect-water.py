
from py2pddl import goal, init

class EMPProblem1(EMPDomain):

    def __init__(self):
        super().__init__()
        self.persons = EMPDomain.Person.create_objs([1], prefix="p")
        self.places = EMPDomain.Place.create_objs(["home", "work"], prefix="a")

    @init
    def init(self):
        at = [self.person_at(self.persons[1], self.places["work"])]
        return at

    @goal
    def goal(self):
        return [self.has_water(self.persons[1])]
