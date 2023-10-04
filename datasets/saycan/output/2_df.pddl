(define (domain household-robot)
  (:requirements :strips :typing)

  (:types
    location - object
    item - object
    robot - object
  )

  (:predicates
    (at ?x - object ?y - location)
    (in ?x - item ?y - robot)
  )

  (:action find
    :parameters (?r - robot ?i - item ?l - location)
    :precondition (at ?r ?l)
    :effect (in ?i ?r)
  )

  (:action go
    :parameters (?r - robot ?from - location ?to - location)
    :precondition (at ?r ?from)
    :effect (and
      (not (at ?r ?from))
      (at ?r ?to)
    )
  )

  (:action pick
    :parameters (?r - robot ?i - item)
    :precondition (and (at ?r ?i) (not (in ?i ?r)))
    :effect (in ?i ?r)
  )

  (:action put
    :parameters (?r - robot ?i - item ?l - location)
    :precondition (and (at ?r ?l) (in ?i ?r))
    :effect (and
      (not (in ?i ?r))
      (at ?i ?l)
    )
  )
)
