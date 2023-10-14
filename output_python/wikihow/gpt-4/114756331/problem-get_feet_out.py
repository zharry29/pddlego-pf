Sure, here's the code for problem file 2:

```python
from py2pddl import goal, init

class GetFeetOutProblem(QuicksandDomain):

    def __init__(self):
        super().__init__()
        self.persons = QuicksandDomain.Person.create_objs([1], prefix="p")
        self.quicksands = QuicksandDomain.Quicksand.create_objs([1], prefix="q")

    @init
    def init(self):
        at = [self.person_in_quicksand(self.persons[1], self.quicksands[1])]
        return at

    @goal
    def goal(self):
        return [self.person_out_quicksand(self.persons[1], self.quicksands[1])]
```
Again, please note that the execution of this code depends on the specific versions of py2pddl and Python. The specified version for py2pddl is 0.0.2 and for Python is 3.7. The code has been simplified for better comprehension.