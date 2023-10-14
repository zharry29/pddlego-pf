(define
	(problem wildernesssurvival3)
	(:domain wildernesssurvival)
	(:objects
		a1 - area
		f1 - food
	)
	(:init (food-at f1 a1))
	(:goal (not (food-at f1 a1)))
)
