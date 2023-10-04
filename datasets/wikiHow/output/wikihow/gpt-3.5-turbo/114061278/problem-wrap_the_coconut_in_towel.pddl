(define (problem wrap-coconut)
  (:domain coconut-tasks)
  (:objects 
    coconut - object
    towel - object
  )
  
  (:init 
    (not (coconut-wrapped))
  )
  
  (:goal (coconut-wrapped))
)