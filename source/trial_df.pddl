(define (domain environment)
  (:requirements :strips :typing)
  (:types
    room item container tool ingredient door direction
  )

  (:predicates
    (room_visited ?r - room)
    (room_adjacent ?r1 ?r2 - room ?d - direction)
    (ingredient_location ?i - ingredient ?l)
    (tool_location ?t - tool ?l)

    (door_open ?d - door)
    (door_between ?d - door ?r1 ?r2 - room)

    (ingredient_in_container ?i - ingredient ?c - container)
    (container_open ?c - container)

    (ingredient_held ?i - ingredient)
    (tool_held ?t - tool)

    (ingredient_cooked ?i - ingredient)
    (ingredient_diced ?i - ingredient)

    (meal_prepared)
  )

  (:action move
    :parameters (?from ?to - room ?d - direction)
    :precondition (and (room_adjacent ?from ?to ?d) (room_visited ?from))
    :effect (and (room_visited ?to))
  )

  (:action open_door
    :parameters (?d - door ?r1 ?r2 - room)
    :precondition (and (not (door_open ?d)) (door_between ?d ?r1 ?r2))
    :effect (door_open ?d)
  )

  (:action open_container
    :parameters (?c - container)
    :precondition (not (container_open ?c))
    :effect (container_open ?c)
  )

  (:action take
    :parameters (?i - ingredient ?c - container)
    :precondition (and (ingredient_in_container ?i ?c) (container_open ?c))
    :effect (and (ingredient_held ?i) (not (ingredient_in_container ?i ?c)))
  )

  (:action use_stove
    :parameters (?i - ingredient ?s - tool)
    :precondition (and (ingredient_held ?i) (tool_held ?s) (not (ingredient_cooked ?i)))
    :effect (ingredient_cooked ?i)
  )

  (:action dice
    :parameters (?i - ingredient ?k - tool)
    :precondition (and (ingredient_held ?i) (tool_held ?k) (not (ingredient_diced ?i)))
    :effect (ingredient_diced ?i)
  )

  (:action prepare_meal
    :parameters ()
    :precondition (and (ingredient_cooked onion) (ingredient_diced onion))
    :effect (meal_prepared)
  )
)