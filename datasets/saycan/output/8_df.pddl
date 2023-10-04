(define (domain robot-task)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location item
    )
    (:predicates
        (at ?x - location)
        (has ?i - item)
        (is_salty ?i - item)
    )
    (:action find
        :parameters (?i - item ?x - location)
        :precondition (at ?x)
        :effect (has ?i)
    )
    (:action go
        :parameters (?x - location)
        :precondition (and)
        :effect (at ?x)
    )
    (:action pick
        :parameters (?i - item)
        :precondition (and (not (has ?i)) (at ?x))
        :effect (has ?i)
    )
    (:action put
        :parameters (?i - item ?u - user)
        :precondition (and (has ?i) (is_salty ?i))
        :effect (not (has ?i))
    )
)
