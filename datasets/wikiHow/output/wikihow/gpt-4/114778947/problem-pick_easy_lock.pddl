Sure, here is the problem file for picking easy lock:

```lisp
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
```