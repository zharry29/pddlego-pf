
from py2pddl import goal, init

class GetEssentialsProblem(NuclearSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.items = NuclearSurvivalDomain.Item.create_objs(["food", "medical_supplies", "communication_supplies", "miscellaneous_items"])
        self.basements = NuclearSurvivalDomain.Basement.create_objs([1], prefix="b")

    @init
    def init(self):
        at = []
        return at

    @goal
    def goal(self):
        return [self.item_in_basement(self.items["food"], self.basements[1]),
                self.item_in_basement(self.items["medical_supplies"], self.basements[1]),
                self.item_in_basement(self.items["communication_supplies"], self.basements[1]),
                self.item_in_basement(self.items["miscellaneous_items"], self.basements[1])]
                
