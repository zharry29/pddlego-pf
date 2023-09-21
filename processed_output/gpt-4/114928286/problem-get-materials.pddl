(define (problem get-materials)
(:domain throw-food)
(:objects
    hotdog tape measure - food
    kitchen store - location
)
(:init
    (is-food hotdog) (is-food tape) (is-food measure)
    (at hotdog store) (at tape store) (at measure store) (empty kitchen)
)
(:goal
    (and
        (at hotdog kitchen) (at tape kitchen) (at measure kitchen)
    )
)
)