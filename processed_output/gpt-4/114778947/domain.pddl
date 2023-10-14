(define (domain lock-picking)
  (:requirements :strips)

  (:types
    car - object
    user - object)

  (:predicates 
    (locked ?x - car)
    (unlocked ?x - car)
    (car-door ?x - car)
    (easy-lock ?x - car)
    (hard-lock ?x - car)
    (has-tool ?x - user))
    
  (:action pick-car-lock
    :parameters (?d - car ?u -user)
    :precondition (and (car-door ?d) (locked ?d) (has-tool ?u))
    :effect (and (unlocked ?d) (not (locked ?d))))
    
  (:action pick-easy-lock
    :parameters (?l - car)
    :precondition (and (easy-lock ?l) (locked ?l) (has-tool ?u))
    :effect (and (unlocked ?l) (not (locked ?l))))

  (:action pick-hard-lock
    :parameters (?l - car)
    :precondition (and (hard-lock ?l) (locked ?l) (has-tool ?u))
    :effect (and (unlocked ?l) (not (locked ?l))))
)