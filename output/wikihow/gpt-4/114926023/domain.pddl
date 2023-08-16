Sure, here is the requested PDDL Domain file:

```lisp
(define (domain stranded-island)
(:requirements :strips :typing)
(:types 
    person material meat
)
(:predicates
    (is-shelter-built ?person)
    (is-meat-obtained ?person)
    (is-meat-prepared ?meat)
    (is-raft-built ?person)
)

(:action build-shelter
    :parameters (?person)
    :precondition (not (is-shelter-built ?person))
    :effect (is-shelter-built ?person)
)

(:action obtain-meat
    :parameters (?person)
    :precondition (not (is-meat-obtained ?person))
    :effect (is-meat-obtained ?person)
)

(:action prepare-meat
    :parameters (?person ?meat)
    :precondition (and (is-meat-obtained ?person) (not (is-meat-prepared ?meat)))
    :effect (is-meat-prepared ?meat)
)

(:action build-raft
    :parameters (?person ?material)
    :precondition (and (not (is-raft-built ?person)) (is-shelter-built ?person) (is-meat-prepared ?meat))
    :effect (is-raft-built ?person)
)
)
```
Please note that for simplicity, this domain assumes that meat is obtained and prepared by the same person and that shelter must be built before building the raft. Similarly, meat must be prepared before the raft is built.