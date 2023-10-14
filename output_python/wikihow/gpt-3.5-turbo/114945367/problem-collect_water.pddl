(define (problem collect-water)
  (:domain survival-guide)
  (:objects
    water1 water2 water3 - water
    source1 source2 source3 - source
    location1 location2 location3 - location)
  (:init
    (at water1 source1)
    (at source1 location1)
    (at water2 source2)
    (at source2 location2)
    (at water3 source3)
    (at source3 location3))
  (:goal
    (and
      (collected water1)
      (collected water2)
      (collected water3))))
