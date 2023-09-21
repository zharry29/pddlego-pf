(define (problem hunger)
    (:domain jungle_survival)
    (:objects
        peter - human
        bananas - resource
    )
    (:init 
        (is_hungry peter)
        (has_resource peter bananas)
    )
    (:goal 
        (is_fed peter)
    )
)