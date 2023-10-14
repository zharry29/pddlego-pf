from py2pddl import goal, init

Sure, here's the code for domain file:

    from py2pddl import Domain, create_type
    from py2pddl import predicate, action

    class QuicksandDomain(Domain):

        Person = create_type("Person")
        Quicksand = create_type("Quicksand")
        Stick = create_type("Stick")

        @predicate(Person, Quicksand)
        def person_in_quicksand(self, p, q):
            pass

        @predicate(Person, Quicksand)
        def person_out_quicksand(self, p, q):
            pass

        @predicate(Person)
        def person_relaxed(self, p):
            pass

        @action(Quicksand)
        def avoid_quicksand(self, q):
            precond = [~self.person_in_quicksand(Person, q)]
            effect = [self.person_out_quicksand(Person, q)]
            return precond, effect

        @action(Person, Quicksand)
        def get_feet_out(self, p, q):
            precond = [self.person_in_quicksand(p, q)]
            effect = [~self.person_in_quicksand(p, q), self.person_out_quicksand(p, q)]
            return precond, effect

        @action(Person, Quicksand, Stick)
        def get_out_deep(self, p, q, s):
            precond = [self.person_in_quicksand(p, q)]
            effect = [~self.person_in_quicksand(p, q), self.person_out_quicksand(p, q)]
            return precond, effect

from py2pddl import goal, init

class GetOutDeepProblem(QuicksandDomain):

    def __init__(self):
        super().__init__()
        self.persons = QuicksandDomain.Person.create_objs([1], prefix="p")
        self.quicksands = QuicksandDomain.Quicksand.create_objs([1], prefix="q")
        self.sticks = QuicksandDomain.Stick.create_objs([1], prefix="s")

    @init
    def init(self):
        at = [self.person_in_quicksand(self.persons[1], self.quicksands[1])]
        return at

    @goal
    def goal(self):
        return [self.person_out_quicksand(self.persons[1], self.quicksands[1])]
