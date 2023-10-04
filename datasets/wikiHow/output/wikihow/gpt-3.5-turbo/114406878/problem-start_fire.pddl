(define (problem problem6-start-fire)
  (:domain survival-woods)
  
  (:objects
    tinder1 tinder2 - has-tinder
    kindling1 kindling2 - has-kindling
    fuel1 fuel2 - has-fuel
  )
  
  (:init
    (has-tinder tinder1)
    (has-tinder tinder2)
    (has-kindling kindling1)
    (has-kindling kindling2)
    (has-fuel fuel1)
    (has-fuel fuel2)
  )
  
  (:goal
    (fire-started)
  )
)