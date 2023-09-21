(define(problem problem1)(:domain shark-attack-survival)
(:objects
    John - human
    Jaws - shark
)
(:init 
    (at John)
    (at Jaws)
    (is-approaching Jaws)
    (defending John)
)
(:goal
    (bonuskilled Jaws)
))