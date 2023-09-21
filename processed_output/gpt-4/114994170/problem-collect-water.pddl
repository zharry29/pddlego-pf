(define (problem collect-water)
  (:domain survive-emp)
  (:objects
    john - person
    home_area - area)
  (:init
    (at john home_area))
  (:goal
    (water-collected)))