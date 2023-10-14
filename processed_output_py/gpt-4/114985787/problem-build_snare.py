
class WildernessSurvivalProblem2(WildernessSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.snares = WildernessSurvivalDomain.Snare.create_objs([1], prefix="sn")
        self.areas = WildernessSurvivalDomain.Area.create_objs(["a1"])

    @init
    def init(self):
        return

    @goal
    def goal(self):
        return [self.snare_at(self.snares[1], self.areas["a1"])]
