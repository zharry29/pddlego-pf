(define (problem cook)
  (:domain environment)
  (:objects
    kitchen - location
    north south east west - direction
  )
  (:init
    (at kitchen)
    (visited kitchen)
    (obj_at fridge kitchen)
    (obj_at toaster kitchen)
    (obj_at stove kitchen)
    (obj_at oven kitchen)
    (have knife)
    (have chicken_wing)
    (have red_apple)
    (have red_onion)
  )
)