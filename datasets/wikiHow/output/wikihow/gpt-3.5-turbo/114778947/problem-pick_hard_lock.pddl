(define (problem pick-hard-lock)
  (:domain lock-picking)
  (:objects hard-lock - lock)
  (:init 
    (locked hard-lock))
  (:goal (picked hard-lock)))