Sure, here is the domain file:

```Lisp
(define (domain survival)
  (:requirements :strips :typing)
  (:types 
    location - object
    material - object
    plants - object
    snare - object
    shelter - object)

  (:predicates 
    (at ?obj - object ?loc - location)
    (eaten ?obj - object)
    (built ?obj - object))

  (:action move
    :parameters (?obj - object ?from - location ?to - location)
    :precondition (at ?obj ?from)
    :effect (and (at ?obj ?to) (not (at ?obj ?from))))

  (:action eat
    :parameters (?plr - object ?plnt - plants)
    :precondition (and (at ?plr ?loc) (at ?plnt ?loc) (not (eaten ?plnt)))
    :effect (and (not (at ?plnt ?loc)) (eaten ?plnt)))

  (:action build_snare
    :parameters (?plr - object ?snr - snare ?mat - material)
    :precondition (and (at ?plr ?loc) (at ?mat ?loc) (not (built ?snr)))
    :effect (and (not (at ?mat ?loc)) (built ?snr)))
  
  (:action build_shelter
    :parameters (?plr - object ?shltr - shelter ?mat - material)
    :precondition (and (at ?plr ?loc) (at ?mat ?loc) (not (built ?shltr)))
    :effect (and (not (at ?mat ?loc)) (built ?shltr)))
)
```
This file defines the problem domain, including objects, locations, types, actions, and their effects for our survival tasks. The actions defined include move, eat, build_snare, and build_shelter. The effects of the actions update the state of the world accordingly. The domain is general enough to be applicable to a variety of related problem situations.