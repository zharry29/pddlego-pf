Sure, here is a problem file for building a shelter:

```
(define (problem build-shelter)
  (:domain surviving-the-woods)
  (:objects
    location1 - location
  )
  (:init
    (at location1)
  )
  (:goal
    (has-shelter location1)
  )
)
```