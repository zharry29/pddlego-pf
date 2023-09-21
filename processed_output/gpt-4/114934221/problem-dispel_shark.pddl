(define (problem problem3)
  (:domain shark-attack-survival)
  (:objects
    John - human
    Jaws - shark
  )

  (:init
    (at John)
    (at Jaws)
    (is-approaching Jaws)
    (have John Jaws)
  )

  (:goal
    (dispeling John)
  )
)