(define (problem robot-problem)
    (:domain robot-domain)
    (:objects
        counter
        table
        user
        trash
        bowl
        initial
    )
    (:init
        (at initial)
        (empty-hand)
    )
    (:goal (and
        (at counter)
        (at table)
        (at user)
        (at trash)
        (at bowl)
    )
)
