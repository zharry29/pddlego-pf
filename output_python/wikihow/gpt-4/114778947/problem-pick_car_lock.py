Sure, here's a problem file for picking a car lock:

```python
from py2pddl import goal, init

class PickCarLockProblem(LockPickingDomain):

    def __init__(self):
        super().__init__()
        self.locks = LockPickingDomain.Lock.create_objs(["car_lock"])

    @init
    def init(self):
        return [self.is_locked(self.locks["car_lock"])]

    @goal
    def goal(self):
        return [~self.is_locked(self.locks["car_lock"])]
```
