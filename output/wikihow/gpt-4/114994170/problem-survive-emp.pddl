Here's the problem file "survive-em":

```lisp
(define (problem survive-em)
    (:domain survive-emp)
    (:objects
        john - person)
    (:init
      (not (survived-emp john))
      (water-collected)
      (ready-for-attack john))
    (:goal
        (survived-emp john))) 
```
The file assumes that John is not yet safe from EMP, but he is prepared for an attack and has collected water. He needs to survive the EMP.