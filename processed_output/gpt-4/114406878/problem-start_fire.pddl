(define (problem problem6)
  (:domain survive_in_the_woods)
  (:objects
    location1 - location
  )
  (:init
    (at location1)
    (has-tinder location1)
    (has-kindling location1)
    (has-fuel location1)
  )
  (:goal
    (has-fire location1)
  )
)