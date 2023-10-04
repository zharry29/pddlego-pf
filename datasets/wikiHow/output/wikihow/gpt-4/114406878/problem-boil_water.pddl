Sure, here is a problem file in PDDL format corresponding to "fill water".

```
(define (problem problem1)
  (:domain survive_in_the_woods)
  (:objects
    location1 - location
  )
  (:init
    (at location1)
  )
  (:goal
    (has-water location1)
  )
)
```