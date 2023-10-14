(define
	(domain party)
	(:requirements :strips :typing)
	(:types
		decoration
		drink
		food
	)
	(:predicates
		(decoration-complete ?d - decoration)
		(drink-ready ?d - drink)
		(food-prepared ?f - food)
	)
	(:action cook
		:parameters (?f - food)
		:precondition (and )
		:effect (food-prepared ?f)
	)
	(:action decorate
		:parameters (?d - decoration)
		:precondition (and )
		:effect (decoration-complete ?d)
	)
	(:action serve-drinks
		:parameters (?d - drink)
		:precondition (and )
		:effect (drink-ready ?d)
	)
)