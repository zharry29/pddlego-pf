
from py2pddl import goal, init

class JungleSurvivalProblem3(JungleSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.bamboo = JungleSurvivalDomain.Bamboo.create_objs([1])
        self.leaf = JungleSurvivalDomain.Leaf.create_objs([1])
        self.fire = JungleSurvivalDomain.Fire.create_objs([1])

    @init
    def init(self):
        at = [self.bamboo_exists(self.bamboo[1]), 
              self.leaf_exists(self.leaf[1])]
        return at

    @goal
    def goal(self):
        return [self.fire_exists(self.fire[1])]
