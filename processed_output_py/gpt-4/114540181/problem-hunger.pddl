(define
	(problem hunger)
	(:domain junglesurvival)
	(:objects
		ffruit fanimal - food
		p1 - person
		pljungle - place
	)
	(:init (person-at p1 pljungle) (not (has-food ffruit p1)) (not (has-food fanimal p1)))
	(:goal (and (has-food ffruit p1) (has-food fanimal p1)))
)
