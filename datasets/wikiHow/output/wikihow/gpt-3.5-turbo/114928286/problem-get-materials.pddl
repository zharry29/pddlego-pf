(define (problem get-materials-problem)
  (:domain amaze-domain)
  
  (:objects
   spot1 - item
   spot2 - item
   spot3 - item)
  
  (:init
   (position spot1)
   (position spot2)
   (position spot3)
   (not (has-materials)))
  
  (:goal (has-materials))
  
  (:metric minimize (total-cost)))