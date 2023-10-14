(define
	(problem amaze)
	(:domain piapproximation)
	(:objects
		hotdog - fooditem
	)
	(:init (fooditem-at-hand hotdog))
	(:goal (fooditem-crossed hotdog))
)
