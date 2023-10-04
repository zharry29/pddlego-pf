Sure, here's the problem file "turn-on-radio":

```lisp
(define (problem turn-on-radio)
    (:domain survive-emp)
    (:init
        (not (radio-on)))
    (:goal
        (radio-on))) 
```
The file presumes that the radio is currently off and needs to be turned on.