Sure! Here's the problem file "prepare-for-attack":

```lisp
(define (problem prepare-for-attack)
    (:domain survive-emp)
    (:objects
        john - person)
    (:init
        (not (ready-for-attack john)))
    (:goal
        (ready-for-attack john))) 
```

The file presumes that John is currently not prepared for an attack and he needs to get ready.