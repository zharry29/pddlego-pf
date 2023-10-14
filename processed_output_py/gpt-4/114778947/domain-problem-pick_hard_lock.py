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

class PickHardLockProblem(LockPickingDomain):

    def __init__(self):
        super().__init__()
        self.locks = LockPickingDomain.Lock.create_objs(["hard_lock"])
        self.keys = LockPickingDomain.Key.create_objs(["bump_key"])

    @init
    def init(self):
        at = [self.is_locked(self.locks["hard_lock"]),
            self.fits(self.keys["bump_key"], self.locks["hard_lock"])]
        return at

    @goal
    def goal(self):
        return [~self.is_locked(self.locks["hard_lock"])]
