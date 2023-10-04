(define (domain household)
    (:requirements :strips :typing)
    (:types
        location
        item
    )
    (:predicates
        (at ?x - location)
        (located ?i - item ?x - location)
    )

    (:action find
        :parameters (?i - item ?x - location)
        :precondition (at ?x)
        :effect (located ?i ?x)
    )

    (:action go
        :parameters (?x - location)
        :effect (and 
                 (at ?x)
                 (not (at (not ?x)))
         )
    )

    (:action pick
        :parameters (?i - item ?x - location)
        :precondition (and (at ?x) (located ?i ?x))
        :effect (not (located ?i ?x))
    )

    (:action put
        :parameters (?i - item ?x - location)
        :precondition (at ?x)
        :effect (located ?i ?x)
    )
)
