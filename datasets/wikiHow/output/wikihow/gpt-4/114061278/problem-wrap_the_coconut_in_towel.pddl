Sure, here is the problem file to wrap the coconut in a towel:

```PDDL
(define (problem wrap_coconut) 
(:domain coconut_processing) 
(:objects 
    coconut1 - coconut 
) 

(:init 
    (have coconut1)
)

(:goal 
    (and 
        (wrapped coconut1)
    )
))
```