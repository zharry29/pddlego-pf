Sure, here is your PDDL Problem file for the task "create shelter":

```lisp
(define (problem create-shelter)
    (:domain stranded-island)
    (:objects 
      Mary - person
     )
    (:init 
      (not (is-shelter-built Mary))
    )
    (:goal (is-shelter-built Mary))
)
```