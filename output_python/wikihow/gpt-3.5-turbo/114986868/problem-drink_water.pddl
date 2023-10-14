(define (problem rink-water)
  (:domain jungle-survival)
  
  ; Objects
  (:objects leaf1 leaf2 bamboo1 bamboo2 stalk1 stalk2 bottle1 bottle2 water1 water2)
  
  ; Initial state
  (:init
    (bent leaf1)
    (bent leaf2)
    (funnel leaf1)
    (funnel leaf2)
    (bamboo-stalk bamboo1)
    (bamboo-stalk bamboo2)
    (flowed water1)
    (flowed water2)
    (natural-pool pool1)
    (