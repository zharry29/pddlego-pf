(define (problem start-fire)
  (:domain surviving-the-woods)
  (:objects
    location1 - location
  )
  (:init
    (at location1)
  )
  (:goal
    (has-fire location1)
  )
)