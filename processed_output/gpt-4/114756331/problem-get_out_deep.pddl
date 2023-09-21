(define (problem problem3) 
    (:domain quicksand)
    (:objects
         pos3 - position
         stick1 - tool
    )
    (:init
         (is-deep pos3)
         (has-tool stick1)
    )
    (:goal
         (freed pos3)
    )
)