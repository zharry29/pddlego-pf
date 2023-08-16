(define (problem problem3-collect-fuel)
  (:domain survival-woods)
  
  (:objects
    branches1 branches2 branches3 - propped-up-branches
    fuel1 fuel2 fuel3 - has-fuel
  )
  
  (:init
    (propped-up-branches branches1)
    (propped-up-branches branches2)
    (propped-up-branches branches3)
    
    (has-fuel fuel1)
    (has-fuel fuel2)
  )
  
  (:goal
    (collected fuel3)
  )
)