
class SurvivalIslandProblem4(SurvivalIslandDomain):

    def __init__(self):
        super().__init__()
        self.people = SurvivalIslandDomain.Person.create_objs([1], prefix="p")

    @init
    def init(self):
        at = [self.is_on_island(self.people[1])]
        return at

    @goal
    def goal(self):
        return [self.has_fire(self.people[1])]
