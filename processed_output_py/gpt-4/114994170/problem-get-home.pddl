(define
	(problem emp2)
	(:domain emp)
	(:objects
		p1 - person
		ahome awork - place
	)
	(:init (person-at p1 awork))
	(:goal (home p1 ahome))
)
