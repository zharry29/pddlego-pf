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
)