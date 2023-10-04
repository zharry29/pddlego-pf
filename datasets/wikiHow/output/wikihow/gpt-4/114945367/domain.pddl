Sure, here is a basic domain file for the proposed tasks:

```
(define (domain surviving-the-woods)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location - object
    fire - object
    player person - location
  )
  (:predicates
    (at ?location - location)
    (has-water ?location - location)
    (has-shelter ?location - location)
    (has-fire ?location - location)
    (has-purified-water ?location - location)
  )
  (:action collect-water
    :parameters (?location - location)
    :precondition (at ?location)
    :effect (has-water ?location)
  )
  (:action build-shelter
    :parameters (?location - location)
    :precondition (at ?location)
    :effect (has-shelter ?location)
  )
  (:action purify-water
    :parameters (?location - location)
    :precondition (and 
      (at ?location)
      (has-water ?location)
    )
    :effect (has-purified-water ?location)
  )
  (:action start-fire
    :parameters (?location - location)
    :precondition (at ?location)
    :effect (has-fire ?location)
  )
)
```