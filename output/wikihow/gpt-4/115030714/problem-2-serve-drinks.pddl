Sure, here is the problem file:

```lisp
(define (problem serve-drinks)
 (:domain anime-party)
 (:objects
   bartender - person
   sake green_tea - drink
 )
 (:init
   (not (served sake))
   (not (served green_tea))
 )
 (:goal
   (and (served sake) (served green_tea))
 )
)
```