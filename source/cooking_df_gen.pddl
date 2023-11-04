(define (domain environment)
  (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions)
  (:types
    location direction ingredient kitchen_appliance knife
  )
  (:predicates
    (at ?loc - location)
    (visited ?loc - location)
    (connected ?loc1 - location ?loc2 - location ?dir - direction)
    (closed_door ?loc1 - location ?loc2 - location)
	  (obj_at ?obj - kitchen_appliance ?loc - location)
	  (have ?item)
	  (chopped ?ingredient - ingredient)
    (sliced ?ingredient - ingredient)
    (diced ?ingredient - ingredient)
	  (fried ?ingredient - ingredient)
	  (grilled ?ingredient - ingredient)
	  (roasted ?ingredient - ingredient)
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

  (:action chop
    :parameters (?ingredient - ingredient ?knife - knife)
    :precondition (have ?knife) 
    :effect (chopped ?ingredient)
  )

  (:action slice
    :parameters (?ingredient - ingredient ?knife - knife)
    :precondition (have ?knife) 
    :effect (sliced ?ingredient)
  )

  (:action dice
    :parameters (?ingredient - ingredient ?knife - knife)
    :precondition (have ?knife) 
    :effect (diced ?ingredient)
  )

  (:action use_stove 
    :parameters (?ingredient - ingredient ?stove - stove)
    :precondition (and (have ?ingredient) (obj_at ?stove kitchen))
    :effect (fried ?ingredient)
  )
 
  
  (:action use_toaster
    :parameters (?ingredient - ingredient ?toaster - toaster)
    :precondition (and (have ?ingredient) (obj_at ?toaster pantry))
    :effect (grilled ?ingredient)
  )

  (:action use_oven
    :parameters (?ingredient - ingredient ?oven - oven)
    :precondition (and (have ?ingredient) (obj_at ?oven kitchen))
    :effect (roasted ?ingredient)
  )
)