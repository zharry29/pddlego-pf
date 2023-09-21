(define (problem papyrus-prob-2)
  (:domain papyrus)
  (:objects
    papyrus-plant - plant
    stalk1 stalk2 stalk3 - good-stalk
    inner-part1 inner-part2 inner-part3 - inner-part
    strips1 strips2 strips3 - strips-cut
    papyrus-sheet - flat
    linen-sheet1 linen-sheet2 - surface-covered
    glue-mixture - glue-mixture
    paper - dried-paper
  )
  
  (:init
    (plant papyrus-plant)
    (good-stalk stalk1)
    (good-stalk stalk2)
    (good-stalk stalk3)
    (inner-part inner-part1)
    (inner-part inner-part2)
    (inner-part inner-part3)
    (strips-cut strips1)
    (strips-cut strips2)
    (strips-cut strips3)
    (flat papyrus-sheet)
    (surface-covered linen-sheet1)
    (surface-covered linen-sheet2)
    (glue-mixture glue-mixture)
  )
  
  (:goal
    (and 
      (weaved papyrus-sheet)
      (pressed papyrus-sheet)
      (dried papyrus-sheet)
      (polished papyrus-sheet)
      (cut papyrus-sheet)
    )
  )
)