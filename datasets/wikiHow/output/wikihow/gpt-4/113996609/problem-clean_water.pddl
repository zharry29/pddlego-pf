Sure, here is problem file 2.

```lisp
(define (problem clean_water)
  (:domain island_survival)
  (:objects 
        john - person 
        cloth - tool 
        pond_water - water
  )
  (:init 
        (has john cloth)
  )
  (:goal 
        (clean pond_water) 
  )
)
```