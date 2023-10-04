(define (problem p1-get-materials)
  (:domain papyrus-making)
  
  (:objects
    material1 - object
    material2 - object
  )

  (:init
    (not (plant-available material1))
    (not (plant-available material2))
  )

  (:goal
    (and (plant-available material1)
         (plant-available material2))
  )
)