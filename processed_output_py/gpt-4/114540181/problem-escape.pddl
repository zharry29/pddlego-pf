(define
	(problem escape)
	(:domain junglesurvival)
	(:objects
		p1 - person
		pljungle plvillage - place
	)
	(:init (person-at p1 pljungle))
	(:goal (person-at p1 plvillage))
)
