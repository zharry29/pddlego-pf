(define
	(domain survivalisland)
	(:requirements :strips :typing)
	(:types
		person
	)
	(:predicates
		(has-clean-water ?p - person)
		(has-fire ?p - person)
		(has-fishing-gear ?p - person)
		(is-on-island ?p - person)
	)
	(:action catch-cook-fish
		:parameters (?p - person)
		:precondition (and (has-fishing-gear ?p) (has-fire ?p))
		:effect (and )
	)
	(:action clean-water
		:parameters (?p - person)
		:precondition (is-on-island ?p)
		:effect (has-clean-water ?p)
	)
	(:action escape-island
		:parameters (?p - person)
		:precondition (is-on-island ?p)
		:effect (not (is-on-island ?p))
	)
	(:action start-fire
		:parameters (?p - person)
		:precondition (is-on-island ?p)
		:effect (has-fire ?p)
	)
)