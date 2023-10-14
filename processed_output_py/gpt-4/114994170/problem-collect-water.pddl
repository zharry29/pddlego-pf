(define
	(problem emp1)
	(:domain emp)
	(:objects
		p1 - person
		ahome awork - place
	)
	(:init (person-at p1 awork))
	(:goal (has-water p1))
)
