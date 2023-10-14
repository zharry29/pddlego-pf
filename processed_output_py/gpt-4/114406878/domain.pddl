(define
	(domain woodssurvival)
	(:requirements :strips :typing)
	(:types
		fire
		fuel
		kindling
		shelter
		tinder
		water
	)
	(:predicates
		(has-fire ?fire - fire)
		(has-fuel ?fuel - fuel)
		(has-kindling ?kindling - kindling)
		(has-shelter ?shelter - shelter)
		(has-tinder ?tinder - tinder)
		(has-water ?water - water)
	)
	(:action build-teepee
		:parameters (?shelter - shelter)
		:precondition (and )
		:effect (has-shelter ?shelter)
	)
	(:action collect-fuel
		:parameters (?fuel - fuel)
		:precondition (and )
		:effect (has-fuel ?fuel)
	)
	(:action fill-water
		:parameters (?water - water)
		:precondition (and )
		:effect (has-water ?water)
	)
	(:action find-tinder
		:parameters (?tinder - tinder)
		:precondition (and )
		:effect (has-tinder ?tinder)
	)
	(:action gather-kindling
		:parameters (?kindling - kindling)
		:precondition (and )
		:effect (has-kindling ?kindling)
	)
	(:action start-fire
		:parameters (?fire - fire ?tinder - tinder ?kindling - kindling ?fuel - fuel)
		:precondition (and (has-tinder ?tinder) (has-kindling ?kindling) (has-fuel ?fuel))
		:effect (has-fire ?fire)
	)
)