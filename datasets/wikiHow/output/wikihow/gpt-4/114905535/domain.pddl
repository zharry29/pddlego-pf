Sure, here is the PDDL domain file according to your request:

```pddl
(define (domain survival)
(:requirements :strips :typing)

(:types
survivor
)

(:predicates
(fire-built)
(water-found)
(food-gathered)
(signal-made)
)

(:action build-fire
:parameters (?s - survivor)
:precondition ()
:effect (fire-built)
)

(:action find-water
:parameters (?s - survivor)
:precondition ()
:effect (water-found)
)

(:action gather-food
:parameters (?s - survivor)
:precondition ()
:effect (food-gathered)
)

(:action make-signal
:parameters (?s - survivor)
:precondition (and (fire-built))
:effect (signal-made)
)
)
```
This domain file describes the actions that a survivor can perform i.e., building fire, finding water, gathering food and making a smoke signal. It's assumed that survivor can initiate any of these actions without a precondition except for making a signal, which requires a fire to be built.