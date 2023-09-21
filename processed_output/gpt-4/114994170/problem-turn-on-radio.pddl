(define (problem turn-on-radio)
    (:domain survive-emp)
    (:init
        (not (radio-on)))
    (:goal
        (radio-on)))