Here's how you could define a problem in PDDL for hunting an animal for food:

```lisp
(define (problem hunt_for_food)
(:domain desert_island_survival)
(:objects rabbit - animals)
(:init 
)
(:goal
	(killed rabbit)
)
)
```