(define (problem build-fire)
  (:domain survival)
  (:objects 
    person1 - person
    location1 - location)
    
  (:init 
    (at person1 location1)
    (has_supplies location1)
    (usable location1))
    
  (:goal (on_fire location1)))
