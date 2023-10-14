
from py2pddl import goal, init

class PapyrusFinishProblem(PapyrusMakingDomain):

    def __init__(self):
        super().__init__()
        self.papyrus = PapyrusMakingDomain.Papyrus.create_objs([1])

    @init
    def init(self):
        at = [self.papyrus_strips_made(self.papyrus[1]),]
        return at

    @goal
    def goal(self):
        return [self.papyrus_finished(self.papyrus[1]),]
