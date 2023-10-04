(define (problem household-task)
  (:domain household)
  (:objects
    table counter trash user initial - location
    apple orange kettle_chips multigrain_chips jalapeno_chips rice_chips energy_bar seven_up coke lime_soda grapefruit_soda pepsi tea redbull water sponge - item
    my_robot - robot
  )
  (:init
    (at initial)
    (in apple counter)
    (in orange table)
    (in kettle_chips counter)
    (in multigrain_chips counter)
    (in jalapeno_chips table)
    (in rice_chips counter)
    (in energy_bar table)
    (in seven_up trash)
    (in coke table)
    (in lime_soda trash)
    (in grapefruit_soda counter)
    (in pepsi trash)
    (in tea counter)
    (in redbull trash)
    (in water user)
    (in sponge trash)
  )
  (:goal
    (hold coke)
  )
)
