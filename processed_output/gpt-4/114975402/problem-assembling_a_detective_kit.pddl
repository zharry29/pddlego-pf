(define (problem problem-2-assembling-detective-kit)
  (:domain detective)
  (:objects gear1 gear2 gear3 - gear)
  (:init
     ;; objects
     (gear gear1)
     (gear gear2)
     (gear gear3)
  )
  
  (:goal (and
           (gear gear1)
           (gear gear2)
           (gear gear3)))
  )