(define (problem survival-task-2)
    (:domain survival)
    (:objects
        location1 - location
        water1 - water
        container1 - container
    )
    (:init
        (at location1)
        (container container1)
        (drinkable water1)
    )
    (:goal (and
        (has water1)
        (>= (hydration) 10)
    ))
    (:metric minimize (total-cost))
)