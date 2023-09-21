(define (problem survival-task-3)
    (:domain survival)
    (:objects
        location1 - location
        shelter1 - location
    )
    (:init
        (at location1)
        (shelter shelter1)
    )
    (:goal (at shelter1))
    (:metric minimize (total-cost))
)