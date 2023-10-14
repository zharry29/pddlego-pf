Sure, here's a problem file for picking a hard lock:

```python
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
```
