(define (problem get-coconut-juice)

(:domain coconut)

(:objects
    coconut-1 - coconut
    screwdriver-1 - tool
    mallet-1 - tool
)

(:init 
    (has-coconut coconut-1)
    (has-tool screwdriver-1)
    (has-tool mallet-1)
)

(:goal (juiced coconut-1))
)