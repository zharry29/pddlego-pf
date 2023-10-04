(define (problem pick-car-lock)
  (:domain lock-picking)
  (:objects car-lock - lock)
  (:init 
    (locked car-lock))
  (:goal (picked car-lock)))