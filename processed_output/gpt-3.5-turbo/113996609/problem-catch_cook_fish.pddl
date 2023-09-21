(define (problem catch-cook-fish)
  (:domain survival)
  (:objects
   person - person
   fish1 fish2 fish3 - food
   location1 location2 - location)
  (:init
   (alive person)
   (at person location1)
   (at fish1 location1)
   (at fish2 location1)
   (at fish3 location2)
   (on-island))
  (:goal 
   (and (not (alive person)) (cooked fish1) (cooked fish2) (cooked fish3))))