(define
	(problem pickhardlock)
	(:domain lockpicking)
	(:objects
		bump_key - key
		hard_lock - lock
	)
	(:init (is-locked hard-lock) (fits bump-key hard-lock))
	(:goal (not (is-locked hard-lock)))
)
