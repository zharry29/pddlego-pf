(define (problem kitchen-problem)
  (:domain environment)
  (:objects
    kitchen pantry - room
    fridge knife cupboard cutlery_drawer trash_can dishwasher - container
    onion flour cookbook dining_chair toaster oven stove - item
  )

  (:init
    (room_at kitchen)
    (door_between kitchen pantry)
    (container_closed fridge)
    (container_closed cupboard)
    (container_closed cutlery_drawer)
    (container_closed trash_can)
    (container_closed dishwasher)
    (container_contains fridge onion)
    (has_item knife)
    (direction_required dice_onion)
    (direction_required fry_onion)
  )

  (:goal
    (and (meal_prepared))
  )
)