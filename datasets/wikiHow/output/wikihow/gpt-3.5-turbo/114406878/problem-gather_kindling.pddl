(define (problem problem5-gather-kindling)
  (:domain survival-woods)
  
  (:objects
    kindling1 kindling2 kindling3 - has-kindling
  )
  
  (:init
    (has-kindling kindling1)
    (has-kindling kindling2)
    (has-kindling kindling3)
  )
  
  (:goal
    (collected kindling3)
  )
)