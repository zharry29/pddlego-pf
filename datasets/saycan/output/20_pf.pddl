(define (problem household-problem)
  (:domain household)

  (:objects 
    apple orange - item
    counter table user trash bowl initial - location
  )

  (:init
    (at apple counter)
    (at orange bowl)
    (at user initial)
    (not_an_apple orange)
  )

  (:goal 
    (and 
      (at orange user)
    )
  )
)
