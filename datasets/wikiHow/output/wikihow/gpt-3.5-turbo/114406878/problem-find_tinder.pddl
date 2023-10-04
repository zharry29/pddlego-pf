(define (problem problem4-find-tinder)
  (:domain survival-woods)
  
  (:objects
    tinder1 tinder2 tinder3 - has-tinder
  )
  
  (:init
    (has-tinder tinder1)
    (has-tinder tinder2)
    (has-tinder tinder3)
  )
  
  (:goal
    (collected tinder3)
  )
)