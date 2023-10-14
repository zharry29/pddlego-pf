
from py2pddl import goal, init

class JungleSurvivalProblem3(JungleSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.humans = JungleSurvivalDomain.Human.create_objs(["explorer3"])
        self.shelters = JungleSurvivalDomain.Shelter.create_objs(["shelter3"])

    @init
    def init(self):
        return [self.at_shelter(self.humans["explorer3"], self.shelters["shelter3"])]

    @goal
    def goal(self):
        return []
