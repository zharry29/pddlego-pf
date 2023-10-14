from py2pddl import goal, init

from py2pddl import Domain, create_type
from py2pddl import predicate, action

class NuclearSurvivalDomain(Domain):

    Item = create_type("Item")
    Shelter = create_type("Shelter")
    Basement = create_type("Basement")

    @predicate(Item, Basement)
    def item_in_basement(self, i, b):
        """If item is in basement"""

    @predicate(Item, Shelter)
    def item_in_shelter(self, i, s):
        """If item is in shelter"""
        
    @predicate(Shelter, Basement)
    def shelter_at(self, s, b):
        """If shelter is located at basement"""
    
    @predicate(Shelter)
    def inforced_shelter(self, s):
        """If shelter is enforced"""
        

    @action(Item, Basement)
    def put_item_in_basement(self, i, b):
        precond = []
        effect = [self.item_in_basement(i, b)]
        return precond, effect

    @action(Item, Shelter)
    def take_item_to_shelter(self, i, s):
        precond = [self.item_in_basement(i, b)]
        effect = [self.item_in_shelter(i, s), ~self.item_in_basement(i, b)]
        return precond, effect
    
    @action(Shelter, Basement)
    def build_shelter_in_basement(self, s, b):
        precond = []
        effect = [self.shelter_at(s, b)]
        return precond, effect

    @action(Shelter)
    def enforce_shelter(self, s):
        precond = [self.shelter_at(s, b)]
        effect = [self.inforced_shelter(s)]
        return precond, effect

from py2pddl import goal, init

class EnforceBasementProblem(NuclearSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.shelters = NuclearSurvivalDomain.Shelter.create_objs([1], prefix="s")
        self.basements = NuclearSurvivalDomain.Basement.create_objs([1], prefix="b")

    @init
    def init(self):
        at = [self.shelter_at(self.shelters[1], self.basements[1])]
        return at

    @goal
    def goal(self):
        return [self.inforced_shelter(self.shelters[1])]
