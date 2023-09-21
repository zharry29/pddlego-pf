(define (problem purify-water)
  (:domain surviving-the-woods)
  (:objects
    location1 - location
  )
  (:init
    (at location1)
    (has-water location1)
  )
  (:goal
    (has-purified-water location1)
  )
)