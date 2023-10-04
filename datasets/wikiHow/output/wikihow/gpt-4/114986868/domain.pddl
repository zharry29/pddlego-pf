Sure, here's a simplified domain file for the specific tasks:

```
(define (domain jungle_survival)

(:requirements :strips :typing)
(:types location - object
        creature - object
        tool - object)

(:predicates 
  (at ?loc - location)
  (has-food ?food - creature)
  (has-tool ?tool - tool)
  (has-fire))

(:action drink-water
  :parameters ()
  :precondition (and (at river))
  :effect ()
)

(:action eat-fish
  :parameters ()
  :precondition (and (has-tool fishing-spear) (has-food fish))
  :effect ()
)

(:action make-fire
  :parameters ()
  :precondition (and (has-tool flint))
  :effect (has-fire)
)

(:action safe-in-cave
  :parameters ()
  :precondition (and (at cave) (has-fire))
  :effect ()
)


)
```  

Please note that this is a simplified domain specification, real world PDDL domain file would contain many more predicates and complexities to represent the totality of the survival situation in the jungle. Please use it to understand how the domain file is structured and how each task/action is defined.