(define (domain coconut-operations)
    (:requirements :strips :typing)
    
    ;; Types
    (:types object)

    ;; Predicates
    (:predicates
        (hole-in-eye ?s - object)
        (coconut ?c - object)
        (coconut-juice ?c - object)
        (coconut-meat ?c - object)
        (oven-used ?c - object)
    )

    ;; Actions
    (:action poke-hole-in-eye
        :parameters (?s - object ?c - object)
        :precondition (and (coconut ?c) (not (hole-in-eye ?s)))
        :effect (hole-in-eye ?s ?c)
    )

    (:action drain-coconut
        :parameters (?c - object)
        :precondition (and (coconut ?c) (not (coconut-juice ?c)))
        :effect (coconut-juice ?c)
    )

    (:action extract-coconut-meat
        :parameters (?c - object)
        :precondition (and (coconut ?c) (not (coconut-meat ?c)))
        :effect (coconut-meat ?c)
    )

    (:action use-oven
        :parameters (?c - object)
        :precondition (coconut ?c)
        :effect (oven-used ?c)
    )

    (:action smash-coconut
        :parameters (?c - object)
        :precondition (and (coconut ?c) (oven-used ?c))
        :effect (and (not (coconut ?c)) (coconut-meat ?c))
    )
)