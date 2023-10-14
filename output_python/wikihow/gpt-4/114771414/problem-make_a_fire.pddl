Sure, here's the problem file for making a fire:

```lisp
(define (problem make_fire)
(:domain desert_island_survival)
(:objects sticks matches - materials fire - boolean)
(:init 
	(inventory sticks)
	(inventory matches)
)
(:goal
	(lit fire)
)
)
```