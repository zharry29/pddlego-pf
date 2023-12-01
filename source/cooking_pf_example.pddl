(define (problem exploration)
  (:domain environment)
  (:objects
    water - ingredient
    red_onion - ingredient
    red_potato - ingredient
    salt - ingredient
    flour - ingredient
    knife - knife
    stove - stove
    kitchen - location
    north south east west - direction
    corridor - location
    pantry - location
    bedroom - location
    backyard - location
    backyard - location
    pantry - location
  )
  (:init
    (have water)
    (have red_onion)
    (have red_potato)
    (have salt)
    (have flour)
    (have knife)
    (obj_at stove kitchen)
    (visited kitchen)
    (connected kitchen corridor north)
    (connected kitchen pantry west)
    (visited corridor)
    (connected corridor kitchen south)
    (connected corridor bedroom east)
    (connected corridor backyard west)
    (at bedroom)
    (visited bedroom)
    (connected bedroom corridor west)
    (at backyard)
    (visited backyard)
    (connected backyard corridor east)
    (at pantry)
    (visited pantry)
    (connected pantry kitchen east)
  )
  (:goal
    (and
        (chopped red_potato)
        (fried red_potato)
        (at kitchen)
    )
  )
)