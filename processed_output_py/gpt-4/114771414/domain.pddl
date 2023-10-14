(define
	(domain desertisland)
	(:requirements :strips :typing)
	(:types
		animal
		fire
		person
		shelter
	)
	(:predicates
		(has-fire ?f - fire)
		(has-food ?p - person ?a - animal)
		(has-shelter ?p - person ?s - shelter)
	)
	(:action build-shelter
		:parameters (?p - person ?s - shelter)
		:precondition (and )
		:effect (has-shelter ?p ?s)
	)
	(:action hunt
		:parameters (?p - person ?a - animal)
		:precondition (and )
		:effect (has-food ?p ?a)
	)
	(:action make-fire
		:parameters (?f - fire)
		:precondition (and )
		:effect (has-fire ?f)
	)
)