(define
	(problem party2)
	(:domain party)
	(:objects
		dgreen_tea dsake dsoy_milk - drink
	)
	(:init )
	(:goal (and (drink-ready dgreen-tea) (drink-ready dsake) (drink-ready dsoy-milk)))
)
