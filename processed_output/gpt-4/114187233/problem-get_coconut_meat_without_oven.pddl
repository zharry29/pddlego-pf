(define (problem get-coconut-meat-without-oven)

(:domain coconut)

(:objects
    coconut-1 - coconut
    screwdriver-1 - tool
    mallet-1 - tool
    knife-1 - tool
)

(:init 
    (has-coconut coconut-1)
    (has-tool screwdriver-1)
    (has-tool mallet-1)
    (has-tool knife-1)
)

(:goal (meat-removed coconut-1))
)