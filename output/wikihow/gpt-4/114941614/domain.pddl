Sure, here's a simple PDDL domain file for the tasks:

```
(define (domain survival)
  (:requirements :typing :fluents)
  (:types 
    location water container
  )
  (:predicates
    (at ?loc - location)
    (has ?water - water)
    (container ?cont - container)
    (drinkable ?water - water)
    (shelter ?loc - location)
  )
  
  (:functions
    (hydration)
  )
  
  (:action move
    :parameters (?from - location ?to - location)
    :precondition (at ?from)
    :effect (and (at ?to) (not (at ?from)))
  )
  
  (:action collect
    :parameters (?water - water ?cont - container)
    :precondition (and (at (location ?water)) (container ?cont))
    :effect (has ?water)
  )
  
  (:action drink
    :parameters (?water - water)
    :precondition (and (has ?water) (drinkable ?water)
    :effect (increase (hydration) 10))
  )
  
  (:action sleep
    :parameters (?loc - location)
    :precondition (shelter ?loc)
    :effect (increase (hydration) 5))
)
```
This is a very basic example and might not cover all situations described in the given text, but it provides a framework for representing actions such as moving, collecting water, drinking, and sleeping in a shelter. The domain is quite simplified and doesn't take into account many details from the text. A more complex domain representation would be required for a more realistic survival scenario.