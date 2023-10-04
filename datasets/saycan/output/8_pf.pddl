(define (problem salty-task)
    (:domain robot-task)
    (:objects
        counter table user trash bowl initial - location
        apple orange kettle_chips multigrain_chips jalapeno_chips rice_chips energy_bar seven-up 
        coke lime_soda grapefruit_soda pepsi tea redbull water sponge - item
    )
    (:init
        (at initial)
        (is_salty kettle_chips)
        (is_salty multigrain_chips)
        (is_salty jalapeno_chips)
        (is_salty rice_chips)
    )
    (:goal (exists (?i - item) (and (is_salty ?i) (not (has ?i)))))
)
