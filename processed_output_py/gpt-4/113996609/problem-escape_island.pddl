(define
	(problem survivalisland3)
	(:domain survivalisland)
	(:objects
		p1 - person
	)
	(:init (is-on-island p1))
	(:goal (not (is-on-island p1)))
)
