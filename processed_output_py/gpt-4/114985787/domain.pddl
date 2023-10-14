(define
	(domain wildernesssurvival)
	(:requirements :strips :typing)
	(:types
		area
		food
		shelter
		snare
	)
	(:predicates
		(food-at ?f - food ?a - area)
		(shelter-at ?s - shelter ?a - area)
		(snare-at ?s - snare ?a - area)
	)
	(:action build-shelter
		:parameters (?s - shelter ?a - area)
		:precondition (and )
		:effect (shelter-at ?s ?a)
	)
	(:action build-snare
		:parameters (?sn - snare ?a - area)
		:precondition (and )
		:effect (snare-at ?sn ?a)
	)
	(:action eat-plants
		:parameters (?f - food ?a - area)
		:precondition (food-at ?f ?a)
		:effect (not (food-at ?f ?a))
	)
)