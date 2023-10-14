(define (domain island_survival)
  (:requirements :strips :typing)
  (:types 
        tool water food fire_location - object
        person - agent
        )
  (:predicates 
        (has ?p - person ?o - object)
        (clean ?w - water)
        (in_location ?p - person ?l - fire_location)
        (fire_started ?l - fire_location)
        (caught ?f - food)
        (cooked ?f - food)
        (island_escaped)
   )

  (:action catch_fish
        :parameters (?p - person ?f - food ?t - tool)
        :precondition (and (has ?p ?t))
        :effect (caught ?f)
  )

  (:action cook_fish
        :parameters (?p - person ?f - food ?t - tool ?l - fire_location)
        :precondition (and (has ?p ?t) (in_location ?p ?l) (fire_started ?l) (caught ?f))
        :effect (cooked ?f)
  )

  (:action clean_water
        :parameters (?p - person ?w - water ?t - tool)
        :precondition (has ?p ?t)
        :effect (clean ?w)
  )

  (:action start_fire
        :parameters (?p - person ?l - fire_location ?t - tool)
        :precondition (and (has ?p ?t) (in_location ?p ?l))
        :effect (fire_started ?l)
  )

  (:action escape_island
        :parameters (?p - person ?r - raft)
        :precondition (and (exists ?r) (has ?p ?r))
        :effect (island_escaped)
  )
)