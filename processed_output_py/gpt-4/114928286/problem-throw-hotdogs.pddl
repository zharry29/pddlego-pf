(define
	(problem throwhotdogs)
	(:domain piapproximation)
	(:objects
		hotdog - fooditem
	)
	(:init (fooditem-at-hand hotdog))
	(:goal (fooditem-tossed hotdog))
)
