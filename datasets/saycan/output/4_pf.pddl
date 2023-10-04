(define (problem householdProblem)
 (:domain household)
 (:objects 
  counter table user trash bowl initial - locations
  apple orange kettleChips multiGrainChips jalapenoChips riceChips energyBar - food
  sevenUp coke limeSoda grapefruitSoda pepsi tea redBull water - drinks
  robot - robot
  sponge - sponge
 )
 (:init
  (at robot counter)
  (at jalapenoChips counter)
  (handEmpty))
 (:goal
  (and
   (not (at jalapenoChips counter))
   (at jalapenoChips trash)
 ))
 )
```

In this PDDL domain and problem, the robot is initially at the counter where the jalapeno chips are. The goal is to remove the jalapeno chips from the counter, either by moving them to the trash or anything else. The location where to move the jalapeno chips can be specified as needed. For simplicity, this example moves the jalapeno chips to the trash.
