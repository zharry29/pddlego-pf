
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
