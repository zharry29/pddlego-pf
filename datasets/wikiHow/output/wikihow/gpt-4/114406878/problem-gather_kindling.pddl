Sure, here is a problem file in PDDL format corresponding to "gather kindling".

```
(define (problem problem5)
  (:domain survive_in_the_woods)
  (:objects
    location1 - location
  )
  (:init
    (at location1)
  )
  (:goal
    (has-kindling location1)
  )
)
```