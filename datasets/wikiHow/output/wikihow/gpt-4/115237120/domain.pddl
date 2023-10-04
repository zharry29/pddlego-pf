Sure, here is a domain file:

```
(define (domain war_survival)
(:requirements :strips :typing)

(:types 
person
food water medicine - item
base house - location
inventory
)

(:predicates 
(in ?p - person ?l - location)
(has ?i - item ?p - person)
(at ?i - item ?b - base)
(healthy ?p - person)
)

(:action fill-inventory
:parameters (?p - person ?b - base ?i - item ?inv - inventory)
:precondition (and (in ?p ?b) (at ?i ?b))
:effect (and 
    (not (at ?i ?b))
    (has ?i ?p)
)

(:action find-shelter
:parameters (?p - person ?h - house)
:precondition (has ?i - item ?p)
:effect (and 
    (not (in ?p ?b))
    (in ?p ?h)
)

(:action heal
:parameters (?p - person ?i - person)
:precondition (and (has medicine ?p) (not (healthy ?i)))
:effect (and 
    (not (has medicine ?p))
    (healthy ?i)
)
)
```