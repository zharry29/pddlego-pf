(define (problem throw-hotdogs)
(:domain throw-food)
(:objects
    hotdog1 hotdog2 hotdog3 hotdog4 hotdog5 - food
    kitchen living - location
    table - object
)
(:init
    (is-food hotdog1) (is-food hotdog2) (is-food hotdog3) (is-food hotdog4) (is-food hotdog5) 
    (at table kitchen) 
    (at hotdog1 kitchen) (at hotdog2 kitchen) (at hotdog3 kitchen) (at hotdog4 kitchen) (at hotdog5 kitchen)
    (empty living)
)
(:goal
    (and
        (at hotdog1 living) (at hotdog2 living) (at hotdog3 living) 
        (at hotdog4 living) (at hotdog5 living)
    )
)
)