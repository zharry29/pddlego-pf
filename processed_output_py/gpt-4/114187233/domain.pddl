(define
	(domain coconut)
	(:requirements :strips :typing)
	(:types
		coconut
	)
	(:predicates
		(is-drained ?c - coconut)
		(is-opened ?c - coconut)
		(is-ripe ?c - coconut)
		(is-wrapped ?c - coconut)
		(juice-extracted ?c - coconut)
		(meat-extracted ?c - coconut)
	)
	(:action break-coconut
		:parameters (?c - coconut)
		:precondition (is-wrapped ?c)
		:effect (is-opened ?c)
	)
	(:action drain-coconut
		:parameters (?c - coconut)
		:precondition (is-opened ?c)
		:effect (is-drained ?c)
	)
	(:action extract-juice
		:parameters (?c - coconut)
		:precondition (is-drained ?c)
		:effect (juice-extracted ?c)
	)
	(:action extract-meat
		:parameters (?c - coconut)
		:precondition (is-drained ?c)
		:effect (meat-extracted ?c)
	)
	(:action wrap-coconut
		:parameters (?c - coconut)
		:precondition (is-ripe ?c)
		:effect (is-wrapped ?c)
	)
)