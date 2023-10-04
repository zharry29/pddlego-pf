(define (problem hit-coconut)
  (:domain coconut-tasks)
  (:objects 
    coconut - object
    mallet - object
  )
  
  (:init 
    (coconut-wrapped)
    (not (coconut-hit))
  )
  
  (:goal (coconut-hit))
)