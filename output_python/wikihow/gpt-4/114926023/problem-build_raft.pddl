Sure, here is your PDDL Problem file for the task "build raft":

```lisp
(define (problem build-raft)
    (:domain stranded-island)
    (:objects 
      John - person
      logs - material
      deer - meat
    )
    (:init 
      (not (is-shelter-built John))
      (not (is-meat-obtained John))
      (not (is-meat-prepared deer))
      (not (is-raft-built John))
    )
    (:goal (is-raft-built John))
)
```