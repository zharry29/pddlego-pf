(define
	(problem emp4)
	(:domain emp)
	(:objects
		p1 - person
		ahome - place
	)
	(:init (home p1 ahome) (has-water p1) (radio-on p1) (prepared-for-attack p1))
	(:goal (and (home p1 ahome) (has-water p1) (radio-on p1) (prepared-for-attack p1)))
)
