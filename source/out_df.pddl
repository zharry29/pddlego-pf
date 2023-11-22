(define (domain environment)
  (:requirements :strips :typing :equality)

  (:types
    room - object
    container - object
    ingredient - object
    utensil - object
    direction - object)

  (:predicates
    (at ?r - room)
    (connected ?r1 - room ?r2 - room ?dir - direction)
    (door-closed ?r1 - room ?r2 - room ?dir - direction)
    (container-closed ?c - container)
    (container-open ?c - container)
    (contains ?c - container ?i - ingredient)
    (has-ingredient ?i - ingredient)
    (ingredient-prepared ?i - ingredient)
    (has-utensil ?u - utensil)
  )

  (:action move
    :parameters (?r1 - room ?r2 - room ?dir - direction)
    :precondition (and (at ?r1) (connected ?r1 ?r2 ?dir) (not (door-closed ?r1 ?r2 ?dir)))
    :effect (and (at ?r2) (not (at ?r1)))
  )

  (:action open_door
    :parameters (?r1 - room ?r2 - room ?dir - direction)
    :precondition (and (at ?r1) (connected ?r1 ?r2 ?dir) (door-closed ?r1 ?r2 ?dir))
    :effect (not (door-closed ?r1 ?r2 ?dir))
  )

  (:action open_container
    :parameters (?c - container)
    :precondition (container-closed ?c)
    :effect (and (container-open ?c) (not (container-closed ?c)))
  )

  (:action take
    :parameters (?i - ingredient ?c - container)
    :precondition (and (container-open ?c) (contains ?c ?i))
    :effect (and (has-ingredient ?i) (not (contains ?c ?i)))
  )

  (:action use_stove
    :parameters (?i - ingredient)
    :precondition (has-ingredient ?i)
    :effect (ingredient-prepared ?i)
  )

  (:action dice
    :parameters (?i - ingredient)
    :precondition (and (has-ingredient ?i) (has-utensil knife))
    :effect (ingredient-prepared ?i)
  )

  (:action prepare_meal
    :parameters ()
    :precondition (and 
        (forall (?i - ingredient) (or (not (has-ingredient ?i)) (ingredient-prepared ?i)))
        (at kitchen))
    :effect (and
        (not (has-ingredient flour))
        (not (has-ingredient onion))
        (not (ingredient-prepared flour))
        (not (ingredient-prepared onion))
    )
  )
)