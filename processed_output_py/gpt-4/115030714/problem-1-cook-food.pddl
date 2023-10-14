(define
	(problem party1)
	(:domain party)
	(:objects
		fsushi fteriyaki ffried_rice - food
	)
	(:init )
	(:goal (and (food-prepared fsushi) (food-prepared fteriyaki) (food-prepared ffried-rice)))
)
