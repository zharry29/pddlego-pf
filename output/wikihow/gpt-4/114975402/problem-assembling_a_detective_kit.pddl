Here's an instance of the problem "assembling a detective kit":

```  
(define (problem problem-2-assembling-detective-kit)
  (:domain detective)
  (:objects gear1 gear2 gear3 - gear)
  (:init
     ;; objects
     (gear gear1)
     (gear gear2)
     (gear gear3)
  )
  
  (:goal (and
           (gear gear1)
           (gear gear2)
           (gear gear3)))
  )
```
This example simplifies the problem into assembling three pieces of detective gear: gear1, gear2 and gear3. The problem is considered solved when all three pieces are gathered.