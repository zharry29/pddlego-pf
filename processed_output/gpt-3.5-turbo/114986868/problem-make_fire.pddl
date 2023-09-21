(define (problem make-fire)
  (:domain jungle-survival)
  
  ; Objects
  (:objects person1 person2 sticks1 sticks2 fire)
  
  ; Initial state
  (:init
    (planted sticks1)
    (planted sticks2)
    (lined sticks1 fire)
    (lined sticks2 fire)
    (supported fire)
    (built fire)
  )
  
  ; Goal
  (:goal (rested person1))
)