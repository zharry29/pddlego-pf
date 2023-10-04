(define (domain survival)
  (:requirements :strips :typing)
  
  ;; Types
  (:types object - thing
          person - object
          animal - object
          location - object
          point - location)
          
  ;; Predicates
  (:predicates 
    (at ?p - person ?l - location)
    (alive ?p - person)
    (injured ?p - person)
    (has_skill ?p - person ?s - object)
    (has_item ?p - person ?i - object)
    (has_supplies ?l - location)
    (usable ?i - object)
    (on_fire ?l - location)
    (safe_location ?l - location)
    (in_danger ?p - person)
    (drinking_water ?l - location)
    (edible_food ?l - location)
    (cooked_meat ?l - location)
    (preserved_meat ?l - location)
    (rescue_signal ?l - location)
    (rescued ?p - person))
    
  ;; Actions
  (:action gather_survivors
    :parameters (?p - person ?l1 - location ?l2 - location)
    :precondition (and (at ?p ?l1) (has_supplies ?l1))
    :effect (and (at ?p ?l2) (has_supplies ?l2) (not (at ?p ?l1))))
    
  (:action gather_supplies
    :parameters (?p - person ?l1 - location ?l2 - location)
    :precondition (and (at ?p ?l1) (has_supplies ?l1))
    :effect (and (at ?p ?l1) (has_supplies ?l2) (not (has_supplies ?l1)) (usable ?l2)))
    
  (:action swim_to_shore
    :parameters (?p - person ?l1 - location ?l2 - location)
    :precondition (and (at ?p ?l1) (has_supplies ?l1) (usable ?l2) (safe_location ?l2))
    :effect (and (at ?p ?l2) (not (at ?p ?l1))))
    
  (:action delegate_tasks
    :parameters (?p1 - person ?p2 - person ?t - object)
    :precondition (and (at ?p1 ?l) (at ?p2 ?l) (has_skill ?p2 ?t))
    :effect (and (has_task ?p1 ?t) (not (at ?p1 ?l))))
    
  (:action find_water
    :parameters (?p - person ?l - location)
    :precondition (and (at ?p ?l) (has_supplies ?l) (usable ?l))
    :effect (and (drinking_water ?l) (not (has_supplies ?l))))
    
  (:action create_shelter
    :parameters (?p - person ?l - location)
    :precondition (and (at ?p ?l) (has_supplies ?l) (usable ?l))
    :effect (and (protected_from_elements ?l) (not (has_supplies ?l))))
    
  (:action build_fire
    :parameters (?p - person ?l - location)
    :precondition (and (at ?p ?l) (has_supplies ?l) (usable ?l))
    :effect (and (on_fire ?l) (not (has_supplies ?l))))
    
  (:action create_signal
    :parameters (?p - person ?l - location)
    :precondition (and (at ?p ?l) (has_supplies ?l) (usable ?l))
    :effect (and (rescue_signal ?l) (not (