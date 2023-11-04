(define (problem cook)
  (:domain environment)
  (:objects
    kitchen pantry - location
    north south east west - direction
	chicken_wing red_apple red_onion - ingredient
	toaster - toaster
	stove - stove
	oven - oven
	knife - knife
  )
  (:init
    (at kitchen)
    (visited kitchen)
    (obj_at toaster pantry)
    (obj_at stove kitchen)
    (obj_at oven kitchen)
    (have knife)
    (have chicken_wing)
    (have red_apple)
    (have red_onion)
  )
  (:goal
    (and
	  (roasted chicken_wing)
	  (diced red_apple)
	  (grilled red_onion)
	)
  )
)