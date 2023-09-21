(define (problem remove_fibre) 
(:domain coconut_processing) 
(:objects 
    coconut1 - coconut 
    knife1 - tool
) 

(:init 
    (have knife1) 
    (have coconut1)
    (meatFree coconut1)
)

(:goal 
    (and 
        (fibreFree coconut1)
    )
))