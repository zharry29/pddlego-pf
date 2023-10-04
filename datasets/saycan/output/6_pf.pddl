(define (problem put_coke_in_gripper)
  (:domain robot-domain)
  (:objects
    counter table user trash bowl initial - location
    apple orange kettle_chips multigrain_chips jalapeno_chips rice_chips energy_bar
    seven_up coke lime_soda grapefruit_soda pepsi tea redbull water - object
  )
  (:init
    (at table coke)
    (at initial robot)
  )
  (:goal
    (in-gripper coke)
  )
)
