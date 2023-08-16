Sure, here's a PDDL problem file corresponding to the task "rink water":

```scheme
(define (problem survival-task-2)
    (:domain survival)
    (:objects
        location1 - location
        water1 - water
        container1 - container
    )
    (:init
        (at location1)
        (container container1)
        (drinkable water1)
    )
    (:goal (and
        (has water1)
        (>= (hydration) 10)
    ))
    (:metric minimize (total-cost))
)
```
This file defines a problem where the goal is to have collected a source of water and drink it. As a result, the hydration level is increased.