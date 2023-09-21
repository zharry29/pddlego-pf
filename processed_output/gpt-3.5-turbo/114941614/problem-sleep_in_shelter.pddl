(define (problem jungle-survival-problem3)
  (:domain jungle-survival)
  (:objects 
    shelter1 lean-to-shelter1 - shelter
  )
  (:init
    (lean_to_shelter shelter1)
  )
  (:goal (shelter_covered shelter1))
  (:metric minimize (total-time))
)