(define (problem pick-easy-lock)
  (:domain lock-picking)
  (:objects
    lockA - easy-lock
    pick-set - tool)
  (:init
    (locked lockA)
    (has-tool pick-set))
  (:goal
    (unlocked lockA))
)