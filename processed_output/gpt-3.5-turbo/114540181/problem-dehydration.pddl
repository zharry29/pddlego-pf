(define (problem dehydration)
  (:domain survival)
  
  (:objects 
    leaf1 - leaf
    leaf2 - leaf
    bottle1 - bottle
    bottle2 - bottle
  )
  
  (:init 
    (rainfall_collected leaf1)
    (bamboo_stalk_bent leaf2)
    (water_bottle_filled bottle1)
    (not (water_bottle_filled bottle2))
  )
  
  (:goal 
    (not (dehydration))
  )
)