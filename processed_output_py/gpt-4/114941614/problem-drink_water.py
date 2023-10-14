 
from py2pddl import goal, init

class JungleSurvivalProblem2(JungleSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.humans = JungleSurvivalDomain.Human.create_objs(["explorer2"])
        self.water_sources = JungleSurvivalDomain.Water.create_objs(["water_source2"])

    @init
    def init(self):
        return [self.has_water(self.humans["explorer2"], self.water_sources["water_source2"])]

    @goal
    def goal(self):
        return []
