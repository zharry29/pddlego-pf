Sure, here is the problem file to poke the coconut's eyes:

```PDDL
(define (problem poke_eyes)
(:domain coconut_processing)
(:objects
    coconut1 - coconut
    screwdriver1 - tool
)

(:init
    (have screwdriver1)
    (have coconut1)
)

(:goal
    (and
        (eyeBored coconut1)
    )
))
```