Sure, here is problem file 4: "get-all-stationery"

```python
from py2pddl import goal, init

class GetAllStationeryProblem(DetectiveKitDomain):

    def __init__(self):
        super().__init__()
        self.bag = DetectiveKitDomain.Bag.create_objs(["duffel"], prefix="b")
        self.stationeries = DetectiveKitDomain.Stationery.create_objs(["notebook", "pen"], prefix="s")

    @init
    def init(self):
        at = []
        return at

    @goal
    def goal(self):
        return [self.stationery_in_bag(self.bag["duffel"], self.stationeries["notebook"]),
                self.stationery_in_bag(self.bag["duffel"], self.stationeries["pen"])]
```