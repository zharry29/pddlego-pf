```python
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
```
