(define (domain kitchen-adventure)
    (:requirements :strips :typing)
    (:types room container object tool direction ingredient)
    
    (:predicates
        (at ?r - room)
        (connected ?r1 ?r2 - room ?d - direction)
        (door-open ?r1 ?r2 - room)
        (door-closed ?r1 ?r2 - room)
        (container-open ?c - container)
        (container-closed ?c - container)
        (contains ?c - container ?o - object)
        (ingredient-prepared ?i - ingredient)
        (meal-prepared)
        (carrying ?o - object)
        (recipe-completed)
        (has-tool ?t - tool)
    )
    
    (:action move
        :parameters (?from ?to - room ?d - direction)
        :precondition (and (at ?from) (connected ?from ?to ?d) (door-open ?from ?to))
        :effect (and (at ?to) (not (at ?from)))
    )

    (:action open_door
        :parameters (?from ?to - room ?d - direction)
        :precondition (and (at ?from) (connected ?from ?to ?d) (door-closed ?from ?to))
        :effect (and (door-open ?from ?to) (not (door-closed ?from ?to)))
    )

    (:action open_container
        :parameters (?c - container)
        :precondition (container-closed ?c)
        :effect (and (container-open ?c) (not (container-closed ?c)))
    )

    (:action take
        :parameters (?c - container ?o - object)
        :precondition (and (container-open ?c) (contains ?c ?o))
        :effect (and (carrying ?o) (not (contains ?c ?o)))
    )

    (:action use_stove
        :parameters (?o - object)
        :precondition (and (carrying ?o) (has-tool stove))
        :effect (ingredient-prepared ?o)
    )

    (:action dice
        :parameters (?o - object)
        :precondition (and (carrying ?o) (has-tool knife))
        :effect (ingredient-prepared ?o)
    )

    (:action prepare_meal
        :parameters ()
        :precondition (and (at kitchen) (has-tool stove) 
                           (ingredient-prepared onion) (ingredient-prepared flour) 
                           (not meal-prepared))
        :effect (meal-prepared)
    )
)