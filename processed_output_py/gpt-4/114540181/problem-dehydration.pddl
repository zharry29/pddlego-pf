(define
	(problem dehydration)
	(:domain junglesurvival)
	(:objects
		p1 - person
		plsource plstream - place
		w1 - water
	)
	(:init (person-at p1 plsource) (not (has-water w1 p1)))
	(:goal (has-water w1 p1))
)
