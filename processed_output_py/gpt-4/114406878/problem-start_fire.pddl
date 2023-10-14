(define
	(problem woodssurvival6)
	(:domain woodssurvival)
	(:objects
		1 - fire
		1 - fuel
		1 - kindling
		1 - tinder
	)
	(:init (has-tinder 1) (has-kindling 1) (has-fuel 1))
	(:goal (has-fire 1))
)
