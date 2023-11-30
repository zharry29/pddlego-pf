(define (domain environment)
  (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions)
  
  (:types
    ingredient container knife toaster stove oven barbeque - object
    location 
    direction
  )
  
  (:predicates
    (at ?loc - location)
    (obj_at ?obj - object ?loc - location)
    (visited ?loc - location)
    (connected ?loc1 - location ?loc2 - location ?dir - direction)
    (closed_door ?loc1 - location ?loc2 - location)
    
    (grilled ?ing - ingredient)
    (roasted ?ing - ingredient)
    (fried ?ing - ingredient)
    (chopped ?ing - ingredient)
    (sliced ?ing - ingredient)
    (diced ?ing - ingredient)
    (have ?obj - object)
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
  
  (:action use_stove
    :parameters (?ing - ingredient ?loc - location ?sto - stove)
    :precondition (and (at ?loc) (obj_at ?sto ?loc) (have ?ing))
    :effect (fried ?ing)
  )
  
  (:action use_toaster
    :parameters (?ing - ingredient ?loc - location ?toa - toaster)
    :precondition (and (at ?loc) (obj_at ?toa ?loc) (have ?ing))
    :effect (grilled ?ing)
  )
  
  (:action use_oven
    :parameters (?ing - ingredient ?loc - location ?ove - oven)
    :precondition (and (at ?loc) (obj_at ?ove ?loc) (have ?ing))
    :effect (roasted ?ing)
  )
  
  (:action use_barbeque
    :parameters (?ing - ingredient ?loc - location ?bbq - barbeque)
    :precondition (and (at ?loc) (obj_at ?bbq ?loc) (have ?ing))
    :effect (grilled ?ing)
  )
  
  (:action chop
    :parameters (?ing - ingredient ?kni - knife)
    :precondition (and (have ?ing) (have ?kni))
    :effect (chopped ?ing)
  )
  
  (:action slice
    :parameters (?ing - ingredient ?kni - knife)
    :precondition (and (have ?ing) (have ?kni))
    :effect (sliced ?ing)
  )
  
  (:action dice
    :parameters (?ing - ingredient ?kni - knife)
    :precondition (and (have ?ing) (have ?kni))
    :effect (diced ?ing)
  )
)