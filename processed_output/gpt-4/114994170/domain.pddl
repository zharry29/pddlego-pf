(define (domain survive-emp)
  (:requirements :strips :typing)
  (:types
    person area object)
  (:predicates
    (at ?p - person ?a - area)
    (home ?a - area)
    (safe ?a - area)
    
    (has ?p - person ?o - object)
    
    (ready-for-attack ?p - person)
    (survived-emp ?p - person)
    (radio-on)
    (water-collected))

  (:action go-home
    :parameters (?p - person ?a - area)
    :precondition (at ?p ?a)
    :effect (and (at ?p (home ?a)) (not (at ?p ?a))))
  
  (:action collect-water
    :parameters (?p - person)
    :effect (water-collected))
  
  (:action prepare-for-attack
    :parameters (?p - person)
    :effect (ready-for-attack ?p))
  
  (:action survive
    :parameters (?p - person)
    :precondition (and (water-collected) (ready-for-attack ?p))
    :effect (survived-emp ?p))
  
  (:action turn-on-radio 
    :parameters ()
    :effect (radio-on)))