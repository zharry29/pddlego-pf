Sure. Here's a basic example of a problem case for assembling disguises:

```  
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
```
Please note, this example simplifies the problem into setting up 3 disguises, named alias1, alias2, and alias3. The problem is considered solved once all 3 disguises are set.