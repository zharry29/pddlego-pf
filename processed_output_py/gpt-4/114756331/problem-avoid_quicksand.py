
from py2pddl import goal, init

class AvoidQuicksandProblem(QuicksandDomain):

    def __init__(self):
        super().__init__()
        self.persons = QuicksandDomain.Person.create_objs([1], prefix="p")
        self.quicksands = QuicksandDomain.Quicksand.create_objs([1], prefix="q")

    @init
    def init(self):
        at = [self.person_in_quicksand(self.persons[1], self.quicksands[1])]
        return at

    @goal
    def goal(self):
        return [self.person_out_quicksand(self.persons[1], self.quicksands[1])]
