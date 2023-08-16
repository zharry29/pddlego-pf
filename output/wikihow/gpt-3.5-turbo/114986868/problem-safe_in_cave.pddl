(define (problem safe-in-cave)
  (:domain jungle-survival)
  
  ; Objects
  (:objects person1 person2 cave1)
  
  ; Initial state
  (:init
    (created-shelter cave1)
    (planted person1)
    (lined person1 cave1)
    (supported cave1)
    (built cave1)
  )
  
  ; Goal
  (:goal (rested person1))
)
