(define
	(problem pickcarlock)
	(:domain lockpicking)
	(:objects
		car_lock - lock
	)
	(:init (is-locked car-lock))
	(:goal (not (is-locked car-lock)))
)
