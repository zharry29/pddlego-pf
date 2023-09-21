(define (problem clean-water)
  (:domain survival)
  (:objects
   person - person
   water1 water2 water3 - water
   location1 location2 - location)
  (:init
   (alive person)
   (at person location1)
   (at water1 location1)
   (at water2 location1)
   (at water3 location2)
   (on-island))
  (:goal 
   (and (not (alive person)) (cleaned water1) (cleaned water2) (cleaned water3))))