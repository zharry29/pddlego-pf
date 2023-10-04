Absolutely! This is how the problem file "collect water" would look like: 

```lisp
(define (problem collect-water)
  (:domain survive-emp)
  (:objects
    john - person
    home_area - area)
  (:init
    (at john home_area))
  (:goal
    (water-collected))) 
```
The file assumes that a person named John is at his home and his objective is to collect water.