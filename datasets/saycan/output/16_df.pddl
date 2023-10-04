(define (domain house-robot)
    (:requirements :strips)
    (:predicates 
        (item-at ?item ?location) 
        (robot-at ?location)
        (holds ?item)
        (contains-caffeine ?item)
    )
    (:action find
        :parameters (?item ?location)
        :precondition (item-at ?item ?location)
        :effect (robot-at ?location)
    )
    (:action go
        :parameters (?location)
        :precondition (robot-at ?location)
        :effect (and (not (robot-at ?location)) (robot-at ?location))
    )
    (:action pick
        :parameters (?item ?location)
        :precondition (and (robot-at ?location) (item-at ?item ?location))
        :effect (and (not (item-at ?item ?location)) (holds ?item))
    )
    (:action put
        :parameters (?item ?location)
        :precondition (and (robot-at ?location) (holds ?item))
        :effect (and (not (holds ?item)) (item-at ?item ?location))
    )
)
