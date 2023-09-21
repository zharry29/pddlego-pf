(define (problem get-home)
    (:domain survive-emp)
    (:objects
        john - person
        home - area
        work - area)
    (:init
        (at john work)
        (home home))
    (:goal
        (at john home)))