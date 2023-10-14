(define
	(domain warsurvival)
	(:requirements :strips :typing)
	(:types
		location
		person
		shelter
		supplies
	)
	(:predicates
		(at ?p - person ?l - location)
		(exists ?s - supplies)
		(has ?p - person ?s - supplies)
		(is-alive ?p - person)
	)
	(:action move
		:parameters (?p - person ?l - location)
		:precondition (is-alive ?p)
		:effect (at ?p ?l)
	)
	(:action pickup
		:parameters (?p - person ?s - supplies)
		:precondition (and (is-alive ?p) (exists ?s))
		:effect (has ?p ?s)
	)
	(:action use
		:parameters (?p - person ?s - supplies)
		:precondition (and (is-alive ?p) (has ?p ?s))
		:effect (not (has ?p ?s))
	)
)