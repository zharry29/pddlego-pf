(define (problem p2-get-papyrus-plant)
  (:domain papyrus-making)
  
  (:objects
    plant1 - object
  )

  (:init
    (not (plant-available plant1))
    (not (stalk-cut plant1))
  )

  (:goal
    (and (plant-available plant1)
         (stalk-cut plant1))
  )
)