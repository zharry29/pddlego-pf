(define (problem kitchen-recipe)
  (:domain environment)

  (:objects
    kitchen pantry - room
    west east - direction
    fridge cupboard cutlery_drawer trash_can dishwasher - container
    flour onion - ingredient
    knife - utensil
  )

  (:init
    (at kitchen)
    (connected kitchen pantry west)
    (connected pantry kitchen east)
    (door-closed kitchen pantry west)
    (container-closed fridge)
    (container-closed cupboard)
    (container-closed cutlery_drawer)
    (container-closed trash_can)
    (container-closed dishwasher)
    (contains fridge onion)
    (contains pantry flour)
    (has-utensil knife)
  )

  (:goal
    (not (has-ingredient flour))
    (not (has-ingredient onion))
    (not (ingredient-prepared flour))
    (not (ingredient-prepared onion))
  )
)