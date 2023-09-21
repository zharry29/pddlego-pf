(define (problem eat-plants)

  (:domain survival-tasks)
  
  (:objects
    berries - plant
    mushrooms - plant
    meadow - location
    woods - location
    basket - object
  )
  
  (:init
    (at berries meadow)
    (at mushrooms woods)
    (at basket meadow)
  )
  
  (:goal
    (collected berries)
    (collected mushrooms)
  )
)