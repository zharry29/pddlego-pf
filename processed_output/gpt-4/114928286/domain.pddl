(define (domain throw-food)
(:requirements :strips :typing)
(:types 
    food location object
)
(:predicates 
    (at ?o - object ?l - location)
    (is-food ?f - food)
    (empty ?l - location)
    (have-food ?f - food)
)
(:action choose-food
    :parameters (?f - food)
    :precondition (is-food ?f)
    :effect (have-food ?f)
)
(:action move-object
    :parameters (?o - object ?from - location ?to - location)
    :precondition (and (at ?o ?from) (empty ?to))
    :effect (and (not (at ?o ?from)) (at ?o ?to))
)
(:action throw-food
    :parameters (?f - food ?l - location)
    :precondition (and (have-food ?f) (empty ?l))
    :effect (and (at ?f ?l) (not (have-food ?f)))
)
)