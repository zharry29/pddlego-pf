```python
from py2pddl import goal, init

class PartyProblem3(PartyDomain):

    def __init__(self):
        super().__init__()
        self.decorations = PartyDomain.Decoration.create_objs(["lanterns", "anime_faces", "costumes"], prefix="d")

    @init
    def init(self):
        at = []
        return at

    @goal
    def goal(self):
        return [self.decoration_complete(self.decorations["lanterns"]),
                self.decoration_complete(self.decorations["anime_faces"]),
                self.decoration_complete(self.decorations["costumes"])]
```