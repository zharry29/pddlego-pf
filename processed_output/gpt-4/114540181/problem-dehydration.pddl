(define (problem dehydration)
    (:domain jungle_survival)
    (:objects
        john - human
        river - water_source
    )
    (:init 
        (dehydrated john)
        (at_water_source john river)
    )
    (:goal 
        (hydrated john)
    )
)