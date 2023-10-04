(define (domain household)
  (:requirements :strips :typing)
  (:types
    location item - object
    robot coke - item
  )

  (:predicates
    (at ?x - location)
    (in ?x - item ?y - location)
    (hold ?x - item)
  )

  (:action find
    :parameters (?x - item ?y - location)
    :precondition (in ?x ?y)
    :effect (not (in ?x ?y))
  )

  (:action go
    :parameters (?x - location)
    :precondition (at ?x)
    :effect (and (not (at ?x))
                 (at ?x))
  )

  (:action pick
    :parameters (?x - item)
    :precondition (not (hold ?x))
    :effect (hold ?x)
  )
  
  (:action put
    :parameters (?x - item ?y - location)
    :precondition (and (hold ?x) (at ?y))
    :effect (in ?x ?y))
)
