(define (domain lock-picking)
  (:requirements :strips :typing)
  (:types lock)
  (:predicates 
    (locked ?l)
    (picked ?l)
    (damaged ?l))
  
  (:action pick-lock
    :parameters (?l - lock)
    :precondition (and (locked ?l) (not (damaged ?l)))
    :effect (and (picked ?l) (not (locked ?l))))
  
  (:action damage-lock
    :parameters (?l - lock)
    :precondition (locked ?l)
    :effect (damaged ?l)))