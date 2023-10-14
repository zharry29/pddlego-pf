Here's how you could define a problem in PDDL for constructing a sturdy shelter:

```lisp
(define (problem construct_shelter)
(:domain desert_island_survival)
(:objects wood nails - materials)
(:init 
	(inventory wood)
	(inventory nails)
)
(:goal
	(constructed shelter)
)
)
```