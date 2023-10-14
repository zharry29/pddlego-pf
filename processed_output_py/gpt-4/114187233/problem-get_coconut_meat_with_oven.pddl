(define
	(problem coconutmeatoven)
	(:domain coconut)
	(:objects
		c1 - coconut
	)
	(:init (is-ripe c1))
	(:goal (and (meat-extracted c1) (is-opened c1)))
)
