(define (problem safe-in-cave)
  (:domain jungle_survival)
  (:objects
    cave - location
  )
  (:init 
    (at cave)
    (has-fire)
  )
  (:goal 
    (safe-in-cave)
  )
)