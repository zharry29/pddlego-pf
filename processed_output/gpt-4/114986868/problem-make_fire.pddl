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