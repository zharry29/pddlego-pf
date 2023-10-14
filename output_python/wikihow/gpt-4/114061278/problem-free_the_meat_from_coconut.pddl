Sure, here is the problem file to free the meat from the coconut:

```PDDL
(define (problem free_coconut_meat) 
(:domain coconut_processing) 
(:objects 
    coconut1 - coconut 
    mallet1 - tool
) 

(:init 
    (have mallet1) 
    (have coconut1)
)

(:goal 
    (and 
        (meatFree coconut1)
    )
))
```