(define (domain desert_island_survival)
(:requirements :strips :typing)
(:types materials structures animals - object fires - boolean)
(:predicates
	(inventory ?materials)
	(constructed ?structures)
	(killed ?animals)
	(prepared ?materials)
	(lit ?fires)
)
(:action construct_shelter
	:parameters (?materials)
	:precondition (and (inventory ?materials))
	:effect (and 
		(not (inventory ?materials))
		(constructed shelter)
	)
)
(:action hunt
	:parameters (?animals)
	:precondition 
	:effect (and 
		(killed ?animals)
	)
)
(:action make_fire
	:parameters (?materials ?fires)
	:precondition (and (inventory ?materials))
	:effect (and 
		(not (inventory ?materials))
		(lit ?fires)
	)
)
)