(define
	(domain emp)
	(:requirements :strips :typing)
	(:types
		person
		place
	)
	(:predicates
		(has-water ?p - person)
		(home ?p - person ?a - place)
		(person-at ?p - person ?a - place)
		(prepared-for-attack ?p - person)
		(radio-on ?p - person)
	)
	(:action collect-water
		:parameters (?p - person)
		:precondition (person-at ?p)
		:effect (has-water ?p)
	)
	(:action get-home
		:parameters (?p - person ?a - place)
		:precondition (person-at ?p ?a)
		:effect (and (not (person-at ?p ?a)) (home ?p ?a))
	)
	(:action prep-for-attack
		:parameters (?p - person)
		:precondition (and (radio-on ?p) (has-water ?p))
		:effect (prepared-for-attack ?p)
	)
	(:action turn-on-radio
		:parameters (?p - person)
		:precondition (home ?p)
		:effect (radio-on ?p)
	)
)