(define (problem pick-easy-lock)
  (:domain lock-picking)
  (:objects easy-lock - lock)
  (:init 
    (locked easy-lock))
  (:goal (picked easy-lock)))