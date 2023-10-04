(define (problem restock-rice-chips)
  (:domain household-robot)

  (:objects
    counter table user trash bowl initial - location
    apple orange kettle chips multigrain chips jalapeno chips rice chips energy bar seven-up coke lime soda grapefruit soda pepsi tea redbull water sponge - item
    bot - robot
  )

  (:init
    (at bot table)
    (at rice chips trash)
  )

  (:goal
    (at rice chips counter)
  )
)
