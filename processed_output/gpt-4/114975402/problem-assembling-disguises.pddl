(define (problem problem-1-assembling-disguises)
 (:domain detective)
 (:objects alias1 alias2 alias3 - alias)
 (:init
   ;; objects
   (disguise alias1)
   (disguise alias2)
   (disguise alias3)
 )
   
 (:goal (and
         (disguise alias1)
         (disguise alias2)
         (disguise alias3)))