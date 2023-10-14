
from py2pddl import goal, init

class StayShelteredProblem(NuclearSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.items = NuclearSurvivalDomain.Item.create_objs(["food"])
        self.shelters = NuclearSurvivalDomain.Shelter.create_objs([1], prefix="s")

    @init
    def init(self):
        at = [self.item_in_shelter(self.items["food"], self.shelters[1])]
        return at

    @goal
    def goal(self):
        return [self.item_in_shelter(self.items["food"], self.shelters[1])]
