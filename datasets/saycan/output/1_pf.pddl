(define (problem task)
    (:domain household)
    (:objects
        table counter - location
    )
    (:init 
        (at initial)
    )
    (:goal 
        (and 
            (at table)
            (at counter)
        )
    )
)
