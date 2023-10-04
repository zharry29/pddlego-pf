Sure, here is problem file 1.

```lisp
(define (problem catch_cook_fish)
  (:domain island_survival)
  (:objects 
        john - person 
        stick - tool 
        water_side - fire_location 
        salmon - food
    )
  (:init 
        (has john stick)
        (in_location john water_side)
  )
  (:goal (and (caught salmon) (cooked salmon)))
)
```