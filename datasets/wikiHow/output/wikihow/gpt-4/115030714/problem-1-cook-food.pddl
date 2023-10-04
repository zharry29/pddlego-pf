Sure, here is the problem file:

```lisp
(define (problem cook-food)
 (:domain anime-party)
 (:objects
   chef - person
   sushi teriyaki beef - dish
 )
 (:init
   (not (cooked sushi))
   (not (cooked teriyaki))
   (not (cooked beef))
 )
 (:goal
   (and (cooked sushi) (cooked teriyaki) (cooked beef))
 )
)
```