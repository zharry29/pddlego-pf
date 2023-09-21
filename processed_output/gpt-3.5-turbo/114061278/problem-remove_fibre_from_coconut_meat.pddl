(define (problem remove-fiber)
  (:domain coconut-tasks)
  (:objects 
    coconut - object
  )
  
  (:init 
    (coconut-wrapped)
    (not (fiber-removed))
  )
  
  (:goal (fiber-removed))
)