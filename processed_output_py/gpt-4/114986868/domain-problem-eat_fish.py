from py2pddl import goal, init

from py2pddl import Domain, create_type
from py2pddl import predicate, action

class JungleSurvivalDomain(Domain):

    Water = create_type("Water")
    Bamboo = create_type("Bamboo")
    Leaf = create_type("Leaf")
    Container = create_type("Container")
    Fish = create_type("Fish")
    Fire = create_type("Fire")
    Cave = create_type("Cave")

    @predicate(Water)
    def water_exists(self, w):
        pass

    @predicate(Bamboo)
    def bamboo_exists(self, b):
        pass

    @predicate(Leaf)
    def leaf_exists(self, l):
        pass

    @predicate(Container)
    def container_exists(self, c):
        pass

    @predicate(Fish)
    def fish_exists(self, f):
        pass

    @predicate(Fire)
    def fire_exists(self, f):
        pass

    @predicate(Cave)
    def cave_exists(self, c):
        pass

    @action(Water, Container)
    def drink_water(self, w, c):
        precond = [self.water_exists(w), self.container_exists(c)]
        effect = [self.water_exists(w), self.container_exists(c)]
        return precond, effect

    @action(Fish, Fire)
    def eat_fish(self, f1, f2):
        precond = [self.fish_exists(f1), self.fire_exists(f2)]
        effect = [self.fish_exists(f1), self.fire_exists(f2)]
        return precond, effect

    @action(Bamboo, Leaf)
    def make_fire(self, b, l):
        precond = [self.bamboo_exists(b), self.leaf_exists(l)]
        effect = [self.fire_exists(f)]
        return precond, effect

    @action(Cave)
    def safe_in_cave(self, c):
        precond = [self.cave_exists(c), self.fire_exists(f)]
        effect = [self.cave_exists(c), self.fire_exists(f)]
        return precond, effect

from py2pddl import goal, init

class JungleSurvivalProblem2(JungleSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.fish = JungleSurvivalDomain.Fish.create_objs([1])
        self.fire = JungleSurvivalDomain.Fire.create_objs([1])

    @init
    def init(self):
        at = [self.fish_exists(self.fish[1]), 
              self.fire_exists(self.fire[1])]
        return at

    @goal
    def goal(self):
        return [self.fish_exists(self.fish[1]), 
                self.fire_exists(self.fire[1])]
