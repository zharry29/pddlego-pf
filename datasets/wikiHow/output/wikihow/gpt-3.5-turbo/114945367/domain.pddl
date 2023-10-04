(define (domain survival-guide)
  (:requirements :strips :typing :equality)
  (:types shelter water source item location - object
          day - time
          tool - item
          kitchenware - tool
          firewood - item
          food - item
          contaminant - item)
  (:predicates
    (at ?x - object ?l - location)
    (collected ?x - item)
    (purified ?w - water)
    (started ?x - fire))
  (:functions
    (time-elapsed)
    (water-level ?w - water)
    (water-source ?w - water)
    (stove ?s - kitchenware)
    (clean ?w - water ?c - contaminant)
    (food-available))
  (:action move
    :parameters (?x - object ?from ?to - location)
    :precondition (and (at ?x ?from))
    :effect (and (not (at ?x ?from))
                 (at ?x ?to)))
  (:action collect-water
    :parameters (?w - water ?s - source)
    :precondition (and (at ?w ?s)
                       (at ?s ?l))
    :effect (and (not (at ?w ?s))
                 (collected ?w)))
  (:action purify-water
    :parameters (?w - water ?t - tool)
    :precondition (and (collected ?w)
                       (at ?w ?l)
                       (at ?t ?l))
    :effect (and (not (collected ?w))
                 (purified ?w)))
  (:action build-shelter
    :parameters (?sh - shelter ?l ?rd ?kd - tool)
    :precondition (and (at ?rd ?l)
                       (at ?kd ?l))
    :effect (and (not (at ?rd ?l))
                 (not (at ?kd ?l))
                 (at ?sh ?l)))
  (:action start-fire
    :parameters (?f - fire ?fw - firewood)
    :precondition (and (at ?fw ?l))
    :effect (and (not (at ?fw ?l))
                 (started ?f)))
)
