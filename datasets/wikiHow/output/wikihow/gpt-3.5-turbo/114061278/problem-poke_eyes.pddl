(define (problem keep-eyes)
  (:domain coconut-tasks)
  (:objects 
    coconut - object
  )
  
  (:init 
    (coconut-wrapped)
    (not (eyes-kept))
  )
  
  (:goal (eyes-kept))
)