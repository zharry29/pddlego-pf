Sure, here's the domain file:

```pddl
(define (domain Papyrus-production)
(:requirements :strips :negative-preconditions)
(:predicates 
    (papyrus ?p)
    (strips ?s)
    (cess-strips ?c)
)

(:action get_papyrus
    :precondition (not (papyrus ?p))
    :effect (papyrus ?p))

(:action get_strips
    :precondition (and (papyrus ?p) (not (strips ?s)))
    :effect (strips ?s))

(:action cess_strips
    :precondition (and (papyrus ?p) (strips ?s) (not (cess-strips ?c)))
    :effect (cess-strips ?c))
)
```