(define (domain survival-tasks)
  (:requirements :strips :typing)
  (:types survivor object - person
          island - object
          location object - place
          direction - object)
  (:predicates 
    (at ?x - survivor ?l - location)
    (carrying ?x - survivor ?obj - object)
    (in ?obj - object ?l - location)
    (connected ?l ?l1 - location)
    (able ?x - survivor)
    (shelter-builtin)
    (water-builtin)
    (animal-builtin)
    (meat-builtin))
  
  (:action swim
    :parameters (?x - survivor ?l - location ?l1 - location ?d - direction)
    :precondition (and (at ?x ?l) (connected ?l ?l1))
    :effect (and (not (at ?x ?l)) (at ?x ?l1)))
  
  (:action gather
    :parameters (?x - survivor ?obj - object ?l - location)
    :precondition (and (at ?x ?l) (in ?obj ?l))
    :effect (and (not (in ?obj ?l)) (carrying ?x ?obj)))
  
  (:action build
    :parameters (?x - survivor ?l - location)
    :precondition (and (at ?x ?l) (able ?x))
    :effect (shelter-builtin))
  
  (:action cook
    :parameters (?x - survivor ?obj - object ?l - location)
    :precondition (and (at ?x ?l) (carrying ?x ?obj) (meat-builtin ?obj))
    :effect (and (not (carrying ?x ?obj)) (meat-builtin ?obj)))
  
  (:action preserve
    :parameters (?x - survivor ?obj - object ?l - location)
    :precondition (and (at ?x ?l) (carrying ?x ?obj) (animal-builtin ?obj))
    :effect (and (not (carrying ?x ?obj)) (animal-builtin ?obj))))
