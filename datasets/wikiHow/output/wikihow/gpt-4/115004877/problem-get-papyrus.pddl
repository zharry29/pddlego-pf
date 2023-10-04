Sure, here's the problem file for "get-papyrus":

```pddl
(define (problem get-papyrus)
(:domain Papyrus-production)

(:objects
    p1 - papyrus
)

(:init
    (not (papyrus p1))
)

(:goal 
    (papyrus p1))
)
```