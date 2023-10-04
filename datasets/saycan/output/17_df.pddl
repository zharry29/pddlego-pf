(define (domain task)
  (:requirements :strips :typing)
  (:types
    location - OBJECT
    item - OBJECT
    soda - item
    other - item
  )

  (:predicates
    (at ?x - location)
    (have ?x - item)
    (item-at ?x - item ?y - location)
    (caffeinated ?s - soda)
  )

  (:action find
    :parameters (?x - item ?y - location)
    :precondition (item-at ?x ?y)
    :effect (and 
                (not (item-at ?x ?y))
                (have ?x))
  )

  (:action go
    :parameters (?x - location)
    :precondition (at ?y)
    :effect (and 
                (not (at ?y))
                (at ?x))
  )

  (:action pick
    :parameters (?x - item)
    :precondition (and 
                   (have ?x)
                   (not (caffeinated ?x)))
    :effect (have ?x)
  )

  (:action put
    :parameters (?x - item)
    :precondition (and 
                  (have ?x)
                  (not (at user)))
    :effect (and
                (at user)
                (not (have ?x)))
  )
)
