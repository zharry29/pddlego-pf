```pddl
(define (domain shark-attack-survival)
  (:requirements :typing)
  (:types shark human - object)
  (:predicates
    (at ?x - object)
    (is-approaching ?x - shark)
    (have ?x ?y - object)
    (bonuskilled ?x - shark)
    (defending ?x - human)
    (dispeling ?x - human)
    (safe ?x - human)
  )

  (:action hard-shim
    :parameters (?h - human ?s - shark)
    :precondition (and (at ?h) (at ?s) (is-approaching ?s) (not (bonuskilled ?s)) (not (dispeling ?h)))
    :effect (and (not (at ?s)) (not (is-approaching ?s)) (bonuskilled ?s) (have ?h ?s))
  )

  (:action defend-position
    :parameters (?h - human)
    :precondition (and (at ?h) (defending ?h))
    :effect (and (not (defending ?h)))
  )

  (:action dispel-shark
    :parameters (?h - human ?s - shark)
    :precondition (and (at ?h) (at ?s) (is-approaching ?s) (have ?h ?s))
    :effect (and (not (at ?s)) (dispeling ?h))
  )

  (:action go-to-safety
    :parameters (?h - human)
    :precondition (not (at ?h))
    :effect (safe ?h)
  )
)
```