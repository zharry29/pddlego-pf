
from py2pddl import goal, init

class DesertIslandProblem1(DesertIslandDomain):

    def __init__(self):
        super().__init__()
        self.person = DesertIslandDomain.Person.create_objs([1], prefix="p")
        self.shelter = DesertIslandDomain.Shelter.create_objs(["sturdyShelter"], prefix="s")

    @init
    def init(self):
        return []

    @goal
    def goal(self):
        return [self.has_shelter(self.person[1], self.shelter["sturdyShelter"])]
