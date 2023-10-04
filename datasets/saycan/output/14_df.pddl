(define (domain refresh)
(:requirements :strips :typing)
(:types
    location food drink - object
    )
(:predicates
    (at ?x - object ?y - location)
    (contains ?x - location ?y - object)
    (holding ?x - object)
    (refreshing ?x - drink)
    )

(:action find
 :parameters (?x - object ?y - location)
 :precondition (and (at ?x ?y))
 :effect (and (holding ?x))
 )

(:action go
 :parameters (?x - location)
 :precondition ()
 :effect (and (at 'robot '?x))
 )

(:action pick
 :parameters (?x - object ?y - location)
 :precondition (and (at 'robot '?y) (contains ?y ?x) (not (holding ?x)))
 :effect (and (holding ?x))
 )

(:action put
 :parameters (?x - object ?y - location)
 :precondition (and (at 'robot '?y) (holding ?x))
 :effect (and (not (holding ?x)) (contains ?y ?x))
 ))

```

Problem File (refresh-problem.pddl):

```
(define (problem refresh-problem)
(:domain refresh)
(:objects
    counter table user trash bowl initial - location
    apple orange kettle-chips multigrain-chips jalapeno-chips rice-chips energy-bar - food
    seven-up coke lime-soda grapefruit-soda pepsi tea redbull water - drink
) 
