(define (domain kitchen)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    direction
    location
    door
  )
  (:predicates
    (at ?loc - location)
    (visited ?loc - location)
    (door ?d - door ?loc1 - location ?loc2 - location ?dir - direction)
    (open ?d - door)
  )

  (:action move
    :parameters (?loc1 - location ?loc2 - location ?d - door ?dir - direction)
    :precondition (and (at ?loc1) (door ?d ?loc1 ?loc2 ?dir) (open ?d))
    :effect (and (not (at ?loc1)) (at ?loc2))
  )

  (:action open_door
    :parameters (?d - door ?loc1 - location ?loc2 - location ?dir - direction)
    :precondition (and (at ?loc1) (door ?d ?loc1 ?loc2 ?dir) (not (open ?d)))
    :effect (open ?d)
  )
)