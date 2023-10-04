Sure, Here is the PDDL domain file:

```lisp
(define (domain lock-picking)
  (:requirements :strips)
  (:predicates 
    (locked ?x)
    (unlocked ?x)
    (car-door ?x)
    (easy-lock ?x)
    (hard-lock ?x)
    (has-tool ?x))
    
  (:action pick-car-lock
    :parameters (?d)
    :precondition (and (car-door ?d) (locked ?d) (has-tool slim-jim))
    :effect (and (unlocked ?d) (not (locked ?d))))
    
  (:action pick-easy-lock
    :parameters (?l)
    :precondition (and (easy-lock ?l) (locked ?l) (has-tool pick-set))
    :effect (and (unlocked ?l) (not (locked ?l))))

  (:action pick-hard-lock
    :parameters (?l)
    :precondition (and (hard-lock ?l) (locked ?l) (has-tool pick-set))
    :effect (and (unlocked ?l) (not (locked ?l))))
)
```
This domain file defines three actions `pick-car-lock`, `pick-easy-lock` and `pick-hard-lock`. Because each of these as an equivalent unlock action, all need a tool and a lock (car-door, easy-lock, hard-lock) and changes the state of the lock from locked to unlocked.