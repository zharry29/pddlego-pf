(define (problem kitchen-adventure)
  (:domain environment)
  (:objects
    kitchen pantry - room
    west east - direction
    door1 - door
    fridge cupboard cutlery_drawer trash_can dishwasher counter - container
    flour onion - ingredient
    knife - tool
  )

  (:init
    (room_adjacent kitchen pantry west)
    
    (door_between door1 kitchen pantry)
    
    (ingredient_location onion fridge)
    (ingredient_location flour pantry)

    (tool_location knife counter)

    (ingredient_in_container onion fridge)

    (tool_held knife) ; Assuming the player has this tool from the start

    (room_visited kitchen)
  )

  (:goal (and (meal_prepared)))
)