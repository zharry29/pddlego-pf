(define (domain environment)
  (:requirements :strips :typing :negation)
  (:types 
    location
    direction
  )
  (:predicates
    (at ?loc - location)
    (visited ?loc - location)
    (connected ?loc1 ?loc2 - location ?dir - direction)
    (closed_door ?loc1 ?loc2 - location)
  )
  (:action move
    :parameters (?from ?to - location ?dir - direction)
    :precondition 
    (and 
      (at ?from)
      (connected ?from ?to ?dir)
      (not (closed_door ?from ?to))
      (not (visited ?to))
    )
    :effect 
    (and 
      (not (at ?from))
      (at ?to)
      (visited ?to)
    )
  )
  (:action open_door
    :parameters (?from ?to - location)
    :precondition 
    (and 
      (at ?from)
      (closed_door ?from ?to)
    )
    :effect
    (not (closed_door ?from ?to))
  )
)