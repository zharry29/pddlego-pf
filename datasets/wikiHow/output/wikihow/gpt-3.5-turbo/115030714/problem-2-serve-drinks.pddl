(define (problem 2-serve-drinks)
  (:domain anime-party)
  
  (:objects
    drink1 drink2 - drink
  )
  
  (:init
    (anime-invitation invitation1)
    (beverage drink1)
  )

  (:goal
    (and
      (beverage drink2)
    )
  )
)
