(define (problem problem1) 
    (:domain quicksand)
    (:objects
         pos1 - position
         stick1 - tool
    )
    (:init
         (is-stuck pos1)
         (has-tool stick1)
    )
    (:goal
         (not (is-stuck pos1))
    )
)