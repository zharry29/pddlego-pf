from py2pddl import goal, init

from py2pddl import Domain, create_type
from py2pddl import predicate, action

class SharkDomain(Domain):

    Human = create_type("Human")
    Shark = create_type("Shark")
    Position = create_type("Position")
    Weapon = create_type("Weapon")

    @predicate(Human, Position)
    def human_at(self, h, pos):
        pass

    @predicate(Shark, Position)
    def shark_at(self, s, pos):
        pass

    @predicate(Human, Shark)
    def watching(self, h, s):
        pass

    @predicate(Human)
    def defended(self, h):
        pass

    @predicate(Shark)
    def deterred(self, s):
        pass

    @action(Human, Shark)
    def watch_shark(self, h, s):
        precond = [self.human_at(h, pos), self.shark_at(s, pos)]
        effect = [self.watching(h, s)]
        return precond, effect

    @action(Human, Position)
    def defend_position(self, h, pos):
        precond = [self.human_at(h, pos), self.watching(h, s)]
        effect = [self.defended(h)]
        return precond, effect

    @action(Human, Shark, Weapon)
    def dispel_shark(self, h, s, w):
        precond = [self.human_at(h, pos), self.shark_at(s, pos), self.watching(h, s), self.defended(h)]
        effect = [self.deterred(s)]
        return precond, effect

    @action(Human, Position)
    def ultimate_win(self, h, pos):
        precond = [self.human_at(h, pos), self.deterred(s)]
        effect = []
        return precond, effect

from py2pddl import goal, init

class SharkProblem3(SharkDomain):

    def __init__(self):
        super().__init__()
        self.humans = SharkDomain.Human.create_objs([1], prefix="h")
        self.sharks = SharkDomain.Shark.create_objs([1], prefix="s")
        self.positions = SharkDomain.Position.create_objs(["pos1"])
        self.weapons = SharkDomain.Weapon.create_objs(["weapon1"])

    @init
    def init(self):
        at = [self.human_at(self.humans[1], self.positions["pos1"]),
              self.shark_at(self.sharks[1], self.positions["pos1"]),
              self.watching(self.humans[1], self.sharks[1]),
              self.defended(self.humans[1])]
        return at

    @goal
    def goal(self):
        return [self.deterred(self.sharks[1])]
