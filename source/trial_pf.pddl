(define (problem exploration)
  (:domain environment)
  (:objects
    black_pepper - ingredient
    block_of_cheese - ingredient
    salt - ingredient
    red_apple - ingredient
    yellow_potato - ingredient
    knife - knife
    toaster - toaster
    kitchen - location
    north south east west - direction
    pantry - location
    corridor - location
    bedroom - location
    backyard - location
    backyard - location
    pantry - location
  )
  (:init
    (have black_pepper)
    (have block_of_cheese)
    (have salt)
    (have red_apple)
    (have yellow_potato)
    (have knife)
    (obj_at barbeque backyard)
    (at pantry)
    (visited kitchen)
    (connected kitchen pantry south)
    (connected kitchen corridor west)
    (visited corridor)
    (connected corridor kitchen east)
    (connected corridor bedroom north)
    (connected corridor backyard west)
    (visited bedroom)
    (connected bedroom corridor south)
    (visited backyard)
    (connected backyard corridor east)
    (visited pantry)
    (connected pantry kitchen north)
  )
  (:goal
    (and
        (sliced block_of_cheese)
        (diced red_apple)
        (chopped yellow_potato)
        (grilled yellow_potato)
        (at kitchen)
    )
  )
)