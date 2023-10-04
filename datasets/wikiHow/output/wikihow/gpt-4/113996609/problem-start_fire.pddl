Sure, here is problem file 4.

```lisp
(define (problem start_fire)
  (:domain island_survival)
  (:objects 
        john - person 
        stick - tool 
        camp - fire_location
  )
  (:init 
        (has john stick)
        (in_location john camp)
  )
  (:goal 
        (fire_started camp) 
  )
)
```