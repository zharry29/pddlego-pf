
from py2pddl import goal, init

class GetMaterialsProblem(PiApproximationDomain):

    def __init__(self):
        super().__init__()
        self.fooditems = PiApproximationDomain.FoodItem.create_objs(["hotdogs"])

    @init
    def init(self):
        at = []
        return at
        
    @goal
    def goal(self):
        return [self.fooditem_at_hand(self.fooditems["hotdogs"])]
