Certainly, here is the problem file for the task 'build shelter':

```Lisp
(define (problem build-shelter)
  (:domain survival)
  (:objects 
    player - object
    forest glade - location
    stick3 stick4 leaves1 - material
    makeshift-shelter - shelter)
  (:init 
    (at player forest)
    (at stick3 forest)
    (at stick4 forest)
    (at leaves1 forest)
    (not (built makeshift-shelter)))
  (:goal (and (built makeshift-shelter))))
```

This file defines the initial state of the world and the goal state for the particular survival problem of building a shelter. The objects used in these states include the player, materials, and the shelter. The goal state clearly specifies that the makeshift-shelter needs to be built.