Sure, here's the domain file:

```
(define (domain coconut)

(:requirements :typing :negative-preconditions)

(:types
    coconut tool
)

(:predicates
    (has-coconut ?c - coconut)
    (has-tool ?t - tool)

    (juiced ?c - coconut)
    (drained ?c - coconut)
    (smashed ?c - coconut)
    (meat-removed ?c - coconut)
    (baked ?c - coconut)
)

(:action drain
    :parameters (?c - coconut ?t - tool)
    :precondition (and (has-coconut ?c) (has-tool ?t))
    :effect (and (drained ?c) (not (has-coconut ?c)))
)

(:action juice
    :parameters (?c - coconut)
    :precondition (drained ?c)
    :effect (juiced ?c)
)

(:action smash
    :parameters (?c - coconut ?t - tool)
    :precondition (and (drained ?c) (has-tool ?t))
    :effect (smashed ?c)
)

(:action remove-meat
    :parameters (?c - coconut ?t - tool)
    :precondition (and (smashed ?c) (has-tool ?t))
    :effect (meat-removed ?c)
)

(:action bake
    :parameters (?c - coconut)
    :precondition (smashed ?c)
    :effect (and (baked ?c) (not (has-coconut ?c)))
)
```
This domain file represents a basic set of actions that can be performed on a coconut with tools, such as draining, juicing, smashing, removing the meat, and baking. The requirements specify that typing and negative preconditions are necessary for the actions to work properly. Each action is defined with parameters, a precondition, and an effect to indicate the changes that occur when the action is taken. For example, the "smash" action requires a coconut that has been drained and a tool, and results in a smashed coconut.