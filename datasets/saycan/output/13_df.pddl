(define (domain household)
  (:requirements :strips :typing)
  (:types
    location - object
    drink - object
    robot - object
  )

  (:predicates
    (at ?x - location ?r - robot)
    (holding ?o - object ?r - robot)
    (drink_at ?d - drink ?l - location)
  )

  (:action find
    :parameters (?r - robot ?d - drink ?l - location)
    :precondition (and (at ?l ?r))
    :effect (and 
              (not (drink_at ?d ?l))
              (holding ?d ?r)
            )
  )

  (:action go
    :parameters (?r - robot ?l - location)
    :precondition (at ?l ?r)
    :effect (at ?l ?r)
  )

  (:action pick
    :parameters (?r - robot ?d - drink ?l - location)
    :precondition (and (at ?l ?r) (not (holding ?d ?r)) (drink_at ?d ?l))
    :effect (holding ?d ?r)
  )

  (:action put
    :parameters (?r - robot ?d - drink)
    :precondition (and (holding ?d ?r))
    :effect (not (holding ?d ?r))
  )
)
