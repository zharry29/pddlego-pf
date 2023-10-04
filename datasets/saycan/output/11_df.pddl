(define (domain household)
(:requirements :strips :typing)
(:types
 location - object
 food - object)
(:predicates
 (at ?x - object ?y - location)
 (holding ?x - object))
(:actions
 (:action go
  :parameters (?x - location)
  :precondition (at robot ?y - location)
  :effect (and (at robot ?x) (not (at robot ?y))))
 
 (:action find
  :parameters (?x - food ?y - location)
  :precondition (and (at robot ?y) (not (holding ?x)))
  :effect (holding ?x))

 (:action pick
  :parameters (?x - food)
  :precondition (and (at ?x , table) (at robot , table) (not (holding ?x)))
  :effect (holding ?x))

 (:action put
  :parameters (?x - food ?y - location)
  :precondition (and (holding ?x) (at robot ?y))
  :effect (and (not (holding ?x)) (at ?x ?y)))))
```

Problem file (task.pddl):

```pddl
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

