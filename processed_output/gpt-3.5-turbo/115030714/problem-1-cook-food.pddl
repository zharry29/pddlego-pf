(define (problem 1-cook-foo)
  (:domain anime-party)
  
  (:objects
    dish1 dish2 - main-dish
  )
  
  (:init
    (anime-invitation invitation1)
    (main-dish dish1)
  )

  (:goal
    (and
      (main-dish dish2)
    )
  )
)