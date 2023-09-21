(define (problem prepare-for-attack)
    (:domain survive-emp)
    (:objects
        john - person)
    (:init
        (not (ready-for-attack john)))
    (:goal
        (ready-for-attack john)))