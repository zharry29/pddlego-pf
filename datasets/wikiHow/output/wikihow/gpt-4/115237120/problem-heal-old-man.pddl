Sure, here is a problem file for heal-old-man:

``` 
(define (problem heal-old-man)
(:domain war_survival)
(:objects 
Luke - person
OldMan - person
medicine1 - medicine
)

(:init 
(has medicine1 Luke)
(not (healthy OldMan))
)

(:goal
(and
(healthy OldMan)
(not (has medicine1 Luke))
)
)
```