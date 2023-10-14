Sure, here's how a domain file for these tasks might look:

```python

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

```
