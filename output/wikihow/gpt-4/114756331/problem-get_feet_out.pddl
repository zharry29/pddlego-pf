Here it is:

```
(define (problem problem2) 
    (:domain quicksand)
    (:objects
         pos2 - position
         stick1 - tool
    )
    (:init
         (is-stuck pos2)
         (has-tool stick1)
    )
    (:goal
         (not (is-stuck pos2))
    )
)
```