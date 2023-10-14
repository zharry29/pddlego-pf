Absolutely, here is the problem file for the task 'eat plants':

```Lisp
(define (problem eat-plants)
  (:domain survival)
  (:objects
    player - object
    forest - location
    berry1 grass1 - plants)
  (:init
    (at player forest)
    (at berry1 forest)
    (at grass1 forest)
    (not (eaten berry1))
    (not (eaten grass1)))
  (:goal (and (eaten berry1) (eaten grass1))))
```

In this problem, the objective is for the player to eat different plant items present in the location. The initial state defines the starting conditions, and the goal state specifies that all plant items should have been eaten.