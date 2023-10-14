(define
	(problem pickeasylock)
	(:domain lockpicking)
	(:objects
		easy_lock - lock
	)
	(:init (is-locked easy-lock))
	(:goal (not (is-locked easy-lock)))
)
