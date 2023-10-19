(define (problem find)
  (:domain environment)
  (:objects
    kitchen pantry - location
    north south east west - direction
    chicken_wing red_apple red_onion - ingredient
    fridge box - container
    toaster - toaster
    stove - stove
    oven - oven
    knife - knife
  )
  (:init
    (at kitchen)
    (visited kitchen)
    (visited pantry)
    (connected kitchen pantry north)
    (obj_at fridge kitchen)
    (obj_at box pantry)
    (obj_at toaster kitchen)
    (obj_at stove kitchen)
    (obj_at oven kitchen)
    (at knife kitchen)
    (contain fridge chicken_wing)
    (have red_apple)
    (have red_onion)
  )
  (:goal 
    (and
        (grilled chicken_wing)
        (chopped red_apple)
        (roasted red_apple)
        (sliced red_onion)
        (fried red_onion)
    )
  )
)