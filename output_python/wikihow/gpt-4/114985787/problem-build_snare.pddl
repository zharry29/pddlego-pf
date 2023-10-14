Sure, here is the problem file for the task 'build snare':

```Lisp
(define (problem build-snare)
  (:domain survival)
  (:objects
    player - object
    jungle - location
    string1 stick1 - material
    animal-snare - snare)
  (:init
    (at player jungle)
    (at string1 jungle)
    (at stick1 jungle)
    (not (built animal-snare)))
  (:goal (built animal-snare)))
```

In this problem, the goal is to build an animal-snare using the materials present in the location. The initial state is set accordingly to describe the location of the player and the availability of the materials.
