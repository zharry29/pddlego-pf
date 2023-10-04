(define (problem house-robot-problem)
    (:domain house-robot)
    (:objects 
        apple orange kettle-chips multigrain-chips jalapeno-chips rice-chips energy-bar 
        seven-up coke lime-soda grapefruit-soda pepsi tea redbull water - item
        counter table user trash bowl initial - location
    )
    (:init 
        (robot-at initial)
        (item-at coke counter)
        (item-at pepsi table)
        (item-at tea bowl)
        (item-at redbull trash)
        (contains-caffeine coke)
        (contains-caffeine pepsi)
        (contains-caffeine tea)
        (contains-caffeine redbull)
    )
    (:goal (and 
        (robot-at user)
        (holds ?item)
        (contains-caffeine ?item)
    ))
)
