from py2pddl import goal, init


from py2pddl import Domain, create_type
from py2pddl import predicate, action

class LockPickingDomain(Domain):

    Lock = create_type("Lock")
    Key = create_type("Key")

    @predicate(Lock)
    def is_locked(self, l):
        pass

    @predicate(Key, Lock)
    def fits(self, k, l):
        pass

    @action(Lock)
    def pick_easy_lock(self, l):
        precond = [self.is_locked(l)]
        effect = [~self.is_locked(l)]
        return precond, effect

    @action(Key, Lock)
    def pick_hard_lock(self, k, l):
        precond = [self.is_locked(l), self.fits(k, l)]
        effect = [~self.is_locked(l)]
        return precond, effect
    
    @action(Lock)
    def pick_car_lock(self, l):
        precond = [self.is_locked(l)]
        effect = [~self.is_locked(l)]
        return precond, effect


from py2pddl import goal, init

class PickEasyLockProblem(LockPickingDomain):

    def __init__(self):
        super().__init__()
        self.locks = LockPickingDomain.Lock.create_objs(["easy_lock"])

    @init
    def init(self):
        return [self.is_locked(self.locks["easy_lock"])]

    @goal
    def goal(self):
        return [~self.is_locked(self.locks["easy_lock"])]
