```pddl
(define (problem problem4)
  (:domain shark-attack-survival)
  (:objects
    John - human
    Jaws - shark
  )

  (:init
    (at John)
    (at Jaws)
    (is-approaching Jaws)
  )

  (:goal
    (safe John)
  )
)
```