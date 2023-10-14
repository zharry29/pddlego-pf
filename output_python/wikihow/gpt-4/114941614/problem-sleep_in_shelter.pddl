Sure, here's a PDDL problem file corresponding to the task "sleep in shelter":

```scheme
(define (problem survival-task-3)
    (:domain survival)
    (:objects
        location1 - location
        shelter1 - location
    )
    (:init
        (at location1)
        (shelter shelter1)
    )
    (:goal (at shelter1))
    (:metric minimize (total-cost))
)
```
This file defines a problem where the goal is to reach a location that is also a shelter.