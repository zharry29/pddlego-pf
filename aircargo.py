# from py2pddl import Domain, create_type
# from py2pddl import predicate, action

# class SurvivalIslandDomain(Domain):

#     Water = create_type("Water")
#     Fish = create_type("Fish")
#     Island = create_type("Island")

#     @predicate(Fish, Island)
#     def fish_at(self, fi, i):
#         """Complete the method signature and specify
#         the respective types in the decorator"""

#     @predicate(Water, Island)
#     def water_at(self, w, i):
#         """Complete the method signature and specify
#         the respective types in the decorator"""

from py2pddl import Domain, create_type
from py2pddl import predicate, action

class SurvivalIslandDomain(Domain):

    Water = create_type("Water")
    Fish = create_type("Fish")
    Fire = create_type("Fire")
    Island = create_type("Island")

    @predicate(Fish, Island)
    def fish_at(self,  f, i):
        """Complete the method signature and specify
        the respective types in the decorator"""

    @predicate(Water, Island)
    def water_at(self, w, i):
        """Complete the method signature and specify
        the respective types in the decorator"""

    @predicate(Fire, Island)
    def fire_at(self, fi, i):
        """Complete the method signature and specify
        the respective types in the decorator"""

    @action(Fish, Island)
    def catch(self, f, i):
        precond = [self.fish_at(f, i)]
        effect = [~self.fish_at(f, i)]
        return precond, effect

    @action(Water, Island)
    def clean(self, w, i):
        precond = [self.water_at(w, i)]
        effect = []
        return precond, effect

    @action(Island)
    def escape(self, i):
        precond = []
        effect = []
        return precond, effect

    @action(Fire, Island)
    def start(self, fi, i):
        precond = []
        effect = [self.fire_at(fi, i)]
        return precond, effect

# from py2pddl import goal, init


# class SurvivalProblem(SurvivalIslandDomain):

#     def __init__(self):
#         super().__init__()
#         self.waters = SurvivalIslandDomain.Water.create_objs([1], prefix="w")
#         self.islands = SurvivalIslandDomain.Island.create_objs(["main"])

#     @init
#     def init(self):
#         at = [self.water_at(self.waters[1], self.islands["main"])]
#         return at

#     @goal
#     def goal(self):
#         return []

from py2pddl import goal, init

class SurvivalProblem(SurvivalIslandDomain):

    def __init__(self):
        super().__init__()
        self.waters = SurvivalIslandDomain.Water.create_objs([1], prefix="w")
        self.islands = SurvivalIslandDomain.Island.create_objs(["main"])

    @init
    def init(self):
        at = [self.water_at(self.waters[1], self.islands["main"])]
        return at

    @goal
    def goal(self):
        return []
    
# class AirCargoProblem(AirCargoDomain):

#     def __init__(self):
#         super().__init__()
#         self.cargos = AirCargoDomain.Cargo.create_objs([1, 2], prefix="c")
#         self.planes = AirCargoDomain.Plane.create_objs([1, 2], prefix="p")
#         self.airports = AirCargoDomain.Airport.create_objs(["sfo", "jfk"])

#     @init
#     def init(self):
#         at = [self.cargo_at(self.cargos[1], self.airports["sfo"]),
#               self.cargo_at(self.cargos[2], self.airports["jfk"]),
#               self.plane_at(self.planes[1], self.airports["sfo"]),
#               self.plane_at(self.planes[2], self.airports["jfk"]),]
#         return at

#     @goal
#     def goal(self):
#         return [self.cargo_at(self.cargos[1], self.airports["jfk"]),
#                 self.cargo_at(self.cargos[2], self.airports["sfo"])]


# from py2pddl import Domain, create_type
# from py2pddl import predicate, action

# class AirCargoDomain(Domain):

#     Plane = create_type("Plane")
#     Cargo = create_type("Cargo")
#     Airport = create_type("Airport")

#     @predicate(Cargo, Airport)
#     def cargo_at(self, c, a):
#         """Complete the method signature and specify
#         the respective types in the decorator"""

#     @predicate(Plane, Airport)
#     def plane_at(self, p, a):
#         """Complete the method signature and specify
#         the respective types in the decorator"""

#     @predicate(Cargo, Plane)
#     def in_(self, c, p):
#         """Complete the method signature and specify
#         the respective types in the decorator"""

#     # @action(Cargo, Plane, Airport)
#     # def load(self, c, p, a):
#     #     precond = [self.cargo_at(c, a), self.plane_at(p, a)]
#     #     effect = [~self.cargo_at(c, a), self.in_(c, p)]
#     #     return precond, effect

#     # @action(Cargo, Plane, Airport)
#     # def unload(self, c, p, a):
#     #     precond = [self.in_(c, p), self.plane_at(p, a)]
#     #     effect = [self.cargo_at(c, a), ~self.in_(c, p)]
#     #     return precond, effect

#     # @action(Plane, Airport, Airport)
#     # def fly(self, p, orig, dest):
#     #     precond = [self.plane_at(p, orig)]
#     #     effect = [~self.plane_at(p, orig), self.plane_at(p, dest)]
#     #     return precond, effect
    
# from py2pddl import goal, init

# class AirCargoProblem(AirCargoDomain):

#     def __init__(self):
#         super().__init__()
#         self.cargos = AirCargoDomain.Cargo.create_objs([1, 2], prefix="c")
#         self.planes = AirCargoDomain.Plane.create_objs([1, 2], prefix="p")
#         self.airports = AirCargoDomain.Airport.create_objs(["sfo", "jfk"])

#     @init
#     def init(self):
#         at = [self.cargo_at(self.cargos[1], self.airports["sfo"]),
#               self.cargo_at(self.cargos[2], self.airports["jfk"]),
#               self.plane_at(self.planes[1], self.airports["sfo"]),
#               self.plane_at(self.planes[2], self.airports["jfk"]),]
#         return at

#     @goal
#     def goal(self):
#         return [self.cargo_at(self.cargos[1], self.airports["jfk"]),
#                 self.cargo_at(self.cargos[2], self.airports["sfo"])]