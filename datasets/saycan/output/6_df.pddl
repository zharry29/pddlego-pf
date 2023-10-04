(define (domain robot-domain)
    (:requirements :strips :typing)
    (:types
        1
        location object - 1
        drink - object
      )
    (:predicates
        (at ?o - 1 ?l - location)
        (in-gripper ?o - object)
      )
    (:action find
        :parameters (?o - object ?l - location)
        :precondition (at ?o ?l)
        :effect (and 
                (not (at ?o ?l))
                (in-gripper ?o))
      )
    (:action go
        :parameters (?l1 - location ?l2 - location)
        :precondition (at ?o ?l1)
        :effect (and
                (not (at ?o ?l1))
                (at ?o ?l2))
      )
    (:action pick
        :parameters (?o - object)
        :precondition (and
                (not (in-gripper ?o))
                (at ?o ?location))
        :effect (in-gripper ?o)
      )
    (:action put
        :parameters (?o - object)
        :precondition (and
                (in-gripper ?o)
                (not (at ?o ?location)))
        :effect (and
                (not (in-gripper ?o))
                (at ?o ?location))
    )
)
