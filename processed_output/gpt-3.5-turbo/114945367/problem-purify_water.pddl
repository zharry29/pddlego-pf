(define (problem purify-water)
  (:domain survival-guide)
  (:objects
    water1 water2 water3 - water
    tool1 tool2 tool3 - tool
    location1 location2 location3 - location)
  (:init
    (at water1 location1)
    (at tool1 location1)
    (at water2 location2)
    (at tool2 location2)
    (at water3 location3)
    (at tool3 location3))
  (:goal
    (and
      (purified water1)
      (purified water2)
      (purified water3))))