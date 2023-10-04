Sure, here is the problem file for picking hard lock:

```lisp
(define (problem pick-hard-lock)
  (:domain lock-picking)
  (:objects
    lockB - hard-lock
    pick-set - tool)
  (:init
    (locked lockB)
    (has-tool pick-set))
  (:goal
    (unlocked lockB))
)
```