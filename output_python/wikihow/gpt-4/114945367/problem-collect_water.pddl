Sure, here is a problem file for collecting water:

```
(define (problem collect-water)
  (:domain surviving-the-woods)
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