(define (domain household)
  (:requirements :strips :typing)
  
  (:types
    item - object
    location - object
  )

  (:predicates
    (at ?item - item ?loc - location)
    (in_hand ?item - item)
    (not_an_apple ?item - item)
  )

  (:action find
    :parameters (?item - item)
    :precondition (at ?item initial) 
    :effect (and
      (not (at ?item initial))
      (in_hand ?item)
    )
  )

  (:action go
    :parameters (?loc - location)
    :effect ()
  )

  (:action pick
    :parameters (?item - item ?loc - location)
    :precondition (and
      (at ?item ?loc)
      (not_an_apple ?item)
    )
    :effect (and
      (not (at ?item ?loc))
      (in_hand ?item)
    )
  )

  (:action put
    :parameters (?item - item ?loc - location)
    :precondition (and
      (in_hand ?item)
      (not (at ?item ?loc))
     )
    :effect (at ?item ?loc)
  )
)
