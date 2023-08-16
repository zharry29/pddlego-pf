Sure, here is the problem file to hit the coconut with a mallet:

```PDDL
(define (problem hit_coconut) 
(:domain coconut_processing) 
(:objects 
    coconut1 - coconut 
    mallet1 - tool
) 

(:init 
    (have mallet1) 
    (have coconut1)
	(wrapped coconut1)
)

(:goal 
    (and 
        (hammered coconut1)
    )
))
```