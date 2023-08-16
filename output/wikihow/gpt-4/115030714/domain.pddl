Sure, here is a simple domain file:

```lisp
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
```  
Please note this is a simple interpretation of the tasks: cook food, serve drinks, and decorate. More complex specifications may entail adding additional predicates, objects, or actions, such as ingredients for the dishes, types of drinks, or different decorations to prepare.