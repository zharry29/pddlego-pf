(define
	(problem emp3)
	(:domain emp)
	(:objects
		p1 - person
		ahome - place
	)
	(:init (home p1 ahome) (has-water p1) (radio-on p1))
	(:goal (prepared-for-attack p1))
)
