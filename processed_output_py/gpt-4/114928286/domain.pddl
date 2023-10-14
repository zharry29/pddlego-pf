(define
	(domain piapproximation)
	(:requirements :strips :typing)
	(:types
		fooditem
		position
	)
	(:predicates
		(fooditem-at-hand ?f - fooditem)
		(fooditem-crossed ?f - fooditem)
		(fooditem-tossed ?f - fooditem)
	)
	(:action check-cross
		:parameters (?f - fooditem)
		:precondition (fooditem-tossed ?f)
		:effect (fooditem-crossed ?f)
	)
	(:action get-material
		:parameters (?f - fooditem)
		:precondition (and )
		:effect (fooditem-at-hand ?f)
	)
	(:action throw-fooditem
		:parameters (?f - fooditem)
		:precondition (fooditem-at-hand ?f)
		:effect (and (not (fooditem-at-hand ?f)) (fooditem-tossed ?f))
	)
)