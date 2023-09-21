(define (problem create_cult)
    (:domain secret_society)
    (:objects 
        cult1 - friend
    )
    (:init
    )
    (:goal
        (and
            (secret_created cult1)
            (members_added cult1)
            (society_created cult1)
        )
    )
)