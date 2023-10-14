(define
	(domain junglesurvival)
	(:requirements :strips :typing)
	(:types
		food
		person
		place
		shelter
		water
	)
	(:predicates
		(has-food ?f - food ?p - person)
		(has-shelter ?p - person ?s - shelter)
		(has-water ?w - water ?p - person)
		(is-safe ?p - person)
		(person-at ?p - person ?pl - place)
	)
	(:action build-shelter
		:parameters (?p - person ?s - shelter)
		:precondition (and (person-at ?p) (not (has-shelter ?p ?s)))
		:effect (has-shelter ?p ?s)
	)
	(:action drink
		:parameters (?p - person ?w - water)
		:precondition (and (person-at ?p) (not (has-water ?w ?p)))
		:effect (has-water ?w ?p)
	)
	(:action eat
		:parameters (?p - person ?f - food)
		:precondition (and (person-at ?p) (not (has-food ?f ?p)))
		:effect (has-food ?f ?p)
	)
	(:action escape
		:parameters (?p - person)
		:precondition (is-safe ?p)
		:effect (not (person-at ?p))
	)
	(:action move
		:parameters (?p - person ?pl - place)
		:precondition (not (person-at ?p ?pl))
		:effect (person-at ?p ?pl)
	)
)