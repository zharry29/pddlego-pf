(define
	(domain lockpicking)
	(:requirements :strips :typing)
	(:types
		key
		lock
	)
	(:predicates
		(fits ?k - key ?l - lock)
		(is-locked ?l - lock)
	)
	(:action pick-car-lock
		:parameters (?l - lock)
		:precondition (is-locked ?l)
		:effect (not (is-locked ?l))
	)
	(:action pick-easy-lock
		:parameters (?l - lock)
		:precondition (is-locked ?l)
		:effect (not (is-locked ?l))
	)
	(:action pick-hard-lock
		:parameters (?k - key ?l - lock)
		:precondition (and (is-locked ?l) (fits ?k ?l))
		:effect (not (is-locked ?l))
	)
)