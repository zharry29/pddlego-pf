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