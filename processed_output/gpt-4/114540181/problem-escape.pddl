(define (problem escape)
    (:domain jungle_survival)
    (:objects
        mary - human
    )
    (:init 
        (is_safe mary)
        (can_escape mary)
    )
    (:goal 
        (not (at_jungle mary))
    )
)