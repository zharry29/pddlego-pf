(define (problem task)
(:domain household)
(:objects 
 counter table user trash bowl initial - location
 apple orange kettle_chips multigrain_chips jalapeno_chips rice_chips energy_bar seven_up coke lime_soda grapefruit_soda pepsi tea redbull water - food
 robot - object)
(:init
 (at robot initial)
 (at jalapeno_chips table))
(:goal 
 (and (at jalapeno_chips user))))
```

This PDDL definition describes a domain in which a robot situated in a house has the possibility to go to different locations, find food and bring it to the user. The robot starts at the initial location and jalapeno chips that is a spicy snack is placed on the table. The goal state is to have the jalapeno chips at the same location as the user indicating that the robot has successfully handed over the chips to the user. It is assumed that jalapeno chips are spicy.

