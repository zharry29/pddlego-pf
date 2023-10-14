
class WildernessSurvivalProblem3(WildernessSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.foods = WildernessSurvivalDomain.Food.create_objs([1], prefix="f")
        self.areas = WildernessSurvivalDomain.Area.create_objs(["a1"])

    @init
    def init(self):
        return [self.food_at(self.foods[1], self.areas["a1"])]

    @goal
    def goal(self):
        # the goal is to not have any food at the area a1
        return [~self.food_at(self.foods[1], self.areas["a1"])]
