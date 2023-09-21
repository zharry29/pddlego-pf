(define (problem fill_glass) 
(:domain coconut_processing) 
(:objects 
    coconut1 - coconut 
    mallet1 - tool 
    glass1 - object 
) 

(:init 
	(have mallet1) 
	(have coconut1)
    (emptyGlass glass1)
)

(:goal 
	(and 
        (filledGlass glass1)
    )
))