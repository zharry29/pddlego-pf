(define (domain environment)
  (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions)
  
  (:types
    container toaster stove oven - tool
    location 
    direction 
    ingredient
  )
  
  (:predicates
    (at ?loc - location)
    (tool_at ?too - tool ?loc - location)
    (visited ?loc - location)
    (connected ?loc1 - location ?loc2 - location ?dir - direction)
    (closed_door ?loc1 - location ?loc2 - location)
    
    (contain ?con - container ?ing - ingredient)
    (grilled ?ing - ingredient)
    (roasted ?ing - ingredient)
    (fried ?ing - ingredient)
    (have ?ing - ingredient)
  )

  (:action move
    :parameters (?loc1 - location ?loc2 - location ?dir - direction)
    :precondition (and (at ?loc1) (connected ?loc1 ?loc2 ?dir) (not (closed_door ?loc1 ?loc2)))
    :effect (and (not (at ?loc1)) (at ?loc2))
  )

  (:action open_door
    :parameters (?loc1 - location ?loc2 - location)
    :precondition (and (at ?loc1) (closed_door ?loc1 ?loc2))
    :effect (not (closed_door ?loc1 ?loc2))
  )
  
  (:action take
    :parameters (?ing - ingredient ?loc - location ?con - container)
    :precondition (and (at ?loc) (tool_at ?con ?loc) (contain ?con ?ing))
    :effect (and (have ?ing) (not (contain ?con ?ing)))
  )
  
  (:action use_stove
    :parameters (?ing - ingredient ?loc - location ?sto - stove)
    :precondition (and (at ?loc) (tool_at ?sto ?loc) (have ?ing))
    :effect (fried ?ing)
  )
  
  (:action use_toaster
    :parameters (?ing - ingredient ?loc - location ?toa - toaster)
    :precondition (and (at ?loc) (tool_at ?toa ?loc) (have ?ing))
    :effect (grilled ?ing)
  )
  
  (:action use_oven
    :parameters (?ing - ingredient ?loc - location ?ove - oven)
    :precondition (and (at ?loc) (tool_at ?ove ?loc) (have ?ing))
    :effect (roasted ?ing)
  )
)