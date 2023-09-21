(define (problem cess-strips)
  (:domain papyrus-paper)
  (:objects
    cypress-papyrus - papyrus-plant
  )
  (:init 
    (papyrus-plant cypress-papyrus)
    (plant-stalk cypress-papyrus stalk1)
    (outer-layer-removed cypress-papyrus)
    (inner-layers-cut cypress-papyrus)
    (strips-soaked cypress-papyrus)
    (strips-laid-out cypress-papyrus)
  )
  (:goal 
    (and 
      (papyrus-plant cypress-papyrus)
      (plant-stalk cypress-papyrus stalk1)
      (outer-layer-removed cypress-papyrus)
      (inner-layers-cut cypress-papyrus)
      (strips-soaked cypress-papyrus)
      (strips-laid-out cypress-papyrus)
    )
  )
)