(define
	(domain junglesurvival)
	(:requirements :strips :typing)
	(:types
		human
		shelter
		water
	)
	(:predicates
		(at-shelter ?h - human ?s - shelter)
		(has-water ?h - human ?w - water)
	)
	(:action drink-water
		:parameters (?h - human ?w - water)
		:precondition (has-water ?h ?w)
		:effect (not (has-water ?h ?w))
	)
	(:action find-shelter
		:parameters (?h - human)
		:precondition (and )
		:effect (at-shelter ?h)
	)
	(:action find-water
		:parameters (?h - human)
		:precondition (and )
		:effect (has-water ?h)
	)
	(:action sleep-in-shelter
		:parameters (?h - human ?s - shelter)
		:precondition (at-shelter ?h ?s)
		:effect (not (at-shelter ?h ?s))
	)
)