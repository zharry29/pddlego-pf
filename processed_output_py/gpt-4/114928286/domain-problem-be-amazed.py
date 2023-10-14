from py2pddl import goal, init

from py2pddl import Domain, create_type
from py2pddl import predicate, action

class PiApproximationDomain(Domain):

    FoodItem = create_type("FoodItem")
    Position = create_type("Position")

    @predicate(FoodItem)
    def fooditem_at_hand(self, f):
        pass

    @predicate(FoodItem)
    def fooditem_tossed(self, f):
        pass

    @predicate(FoodItem)
    def fooditem_crossed(self, f):
        pass

    @action(FoodItem)
    def get_material(self, f):
        precond = []
        effect = [self.fooditem_at_hand(f)]
        return precond, effect

    @action(FoodItem)
    def throw_fooditem(self, f):
        precond = [self.fooditem_at_hand(f)]
        effect = [~self.fooditem_at_hand(f), self.fooditem_tossed(f)]
        return precond, effect

    @action(FoodItem)
    def check_cross(self, f):
        precond = [self.fooditem_tossed(f)]
        effect = [self.fooditem_crossed(f)]
        return precond, effect

from py2pddl import goal, init

class AmazeProblem(PiApproximationDomain):

    def __init__(self):
        super().__init__()
        self.fooditems = PiApproximationDomain.FoodItem.create_objs(["hotdog"])

    @init
    def init(self):
        at = [self.fooditem_at_hand(self.fooditems["hotdog"])]
        return at

    @goal
    def goal(self):
        return [self.fooditem_crossed(self.fooditems["hotdog"])]
