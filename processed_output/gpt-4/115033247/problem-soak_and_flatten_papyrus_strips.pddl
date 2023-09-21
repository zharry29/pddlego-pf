(define (problem soak-and-flatten-papyrus)
    (:domain papyrus-making)
    (:objects 
        plant1 - plant
        strip1 strip2 strip3 - strip
        board1 - board
        book1 - book
        water1 water2 water3 - water
    )
    (:init 
        (has plant1)
        (has board1)
        (has book1)
        (has water1)
        (has water2)
        (has water3)
    )
    (:goal
        (and 
            (soaked strip1)
            (soaked strip2)
            (soaked strip3)
            (rolled strip1)
            (rolled strip2)
            (rolled strip3)
        )
    )
)
```
This problem statement assumes that the goal is to soak and flatten (roll)