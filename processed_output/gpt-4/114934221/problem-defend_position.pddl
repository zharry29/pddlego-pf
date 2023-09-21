(define (problem problem2)
  (:domain shark-attack-survival)
  (:objects
    John - human
    Jaws - shark
  )

  (:init
    (at John)
    (defending John)
  )

  (:goal
    (not (defending John))
  )
)