(define (problem escape-island)
  (:domain survival)
  (:objects
   person - person)
  (:init
   (alive person)
   (on-island))
  (:goal 
   (and (not (on-island)) (survived))))