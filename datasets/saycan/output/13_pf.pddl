(define (problem get-drink-task)
  (:domain household)
  (:objects
    kitchen - location
    user - location
    robot - robot
    coke - drink
  )

  (:init
    (at kitchen robot)
    (drink_at coke kitchen)
  )

  (:goal
    (and
      (at user robot)
      (holding coke robot)
    )
  )
)
