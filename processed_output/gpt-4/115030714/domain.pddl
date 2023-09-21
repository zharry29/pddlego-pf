(define (domain anime-party)
(:requirements :strips :typing)
(:types
  person - object
  dish - object
  drink - object
  decoration - object
  )
(:predicates
  (cooked ?d - dish)
  (served ?d - dish)
  (decorated ?deco - decoration)
  )
(:action cook
  :parameters (?person - person ?dish - dish)
  :precondition (and (not (cooked ?dish)))
  :effect (cooked ?dish)
 )
(:action serve_drink
  :parameters (?person - person ?drink - drink)
  :precondition (not (forall (?d - drink) (not (served ?d))))
  :effect (served ?drink)
 )
(:action decorate
  :parameters (?person - person ?deco - decoration)
  :precondition (not (forall (?d - decoration) (not (decorated ?d))))
  :effect (decorated ?deco)
 )
)