Sure, here's a problem file for the task 'make fire':

```
(define (problem make-fire)
  (:domain jungle_survival)
  (:objects
    flint - tool
  )
  (:init 
    (has-tool flint)
  )
  (:goal 
    (has-fire)
  )
)
```