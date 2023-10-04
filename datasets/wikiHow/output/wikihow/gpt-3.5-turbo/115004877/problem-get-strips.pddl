(define (problem get-strips)
  (:domain papyrus-paper)
  (:objects
    cypress-papyrus - papyrus-plant
  )
  (:init 
    (papyrus-plant cypress-papyrus)
    (plant-stalk cypress-papyrus stalk1)
  )
  (:goal 
    (and 
      (papyrus-plant cypress-papyrus)
      (plant-stalk cypress-papyrus stalk1)
      (outer-layer-removed cypress-papyrus)
      (inner-layers-cut cypress-papyrus)
    )
  )
)