Here's the problem file "get-home":

```lisp
(define (problem get-home)
    (:domain survive-emp)
    (:objects
        john - person
        home - area
        work - area)
    (:init
        (at john work)
        (home home))
    (:goal
        (at john home))) 
```
The file assumes that John is currently at work and wants to go home.