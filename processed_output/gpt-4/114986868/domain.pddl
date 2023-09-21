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