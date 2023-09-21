(define (problem problem1-solve-water)
  (:domain survival-woods)
  
  (:objects
    source1 source2 source3 - water-source
  )
  
  (:init
    (water-source source1)
    (water-source source2)
    (water-source source3)
    
    (dry-flat-area-between-trees area1)
    (has-support-branch branch1)
    (propped-up-branches branches1)
    (has-tinder tinder1)
    (has-kindling kindling1)
    (has-fuel fuel1)
  )
  
  (:goal
    (collected source1)
  )
)