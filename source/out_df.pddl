(define (domain environment)
  (:requirements :strips :typing)
  (:types
    room item container device - object
  )
  (:predicates
    (room_at ?r - room)
    (door_between ?r1 ?r2 - room)
    (door_open ?r1 ?r2 - room)
    (connected ?r1 ?r2 - room)
    (container_closed ?c - container)
    (container_contains ?c - container ?i - item)
    (has_item ?i - item)
    (ingredient_ready ?i - item)
    (direction_required ?d)
    (meal_prepared)
  )

  (:action move
    :parameters (?from ?to - room)
    :precondition (and (room_at ?from) (connected ?from ?to))
    :effect (and (not (room_at ?from)) (room_at ?to))
  )

  (:action open_door
    :parameters (?from ?to - room)
    :precondition (and (room_at ?from) (door_between ?from ?to) (not (door_open ?from ?to)))
    :effect (and (door_open ?from ?to) (connected ?from ?to) (connected ?to ?from))
  )

  (:action open_container
    :parameters (?c - container)
    :precondition (container_closed ?c)
    :effect (not (container_closed ?c))
  )

  (:action take
    :parameters (?i - item ?c - container)
    :precondition (and (not (container_closed ?c)) (container_contains ?c ?i))
    :effect (and (has_item ?i) (not (container_contains ?c ?i)))
  )

  (:action use_stove
    :parameters (?i - item)
    :precondition (and (has_item ?i) (direction_required fry_?i))
    :effect (and (ingredient_ready ?i) (not (direction_required fry_?i)))
  )

  (:action dice
    :parameters (?i - item)
    :precondition (and (has_item ?i) (has_item knife) (direction_required dice_?i))
    :effect (and (ingredient_ready ?i) (not (direction_required dice_?i)))
  )

  (:action prepare_meal
    :parameters ()
    :precondition (and (not (direction_required dice_onion)) 
                       (not (direction_required fry_onion))
                       (ingredient_ready onion) 
                       (ingredient_ready flour)
                       (room_at kitchen))
    :effect (meal_prepared)
  )
)