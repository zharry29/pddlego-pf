(define
	(domain papermaking)
	(:requirements :strips :typing)
	(:types
		material
		papyruspaper
		papyrusplant
	)
	(:predicates
		(made-paper ?pp - papyruspaper)
		(material-available ?m - material)
		(plant-available ?p - papyrusplant)
	)
	(:action get-materials
		:parameters (?m - material)
		:precondition (not (material-available ?m))
		:effect (material-available ?m)
	)
	(:action get-papyrus-plant
		:parameters (?p - papyrusplant)
		:precondition (not (plant-available ?p))
		:effect (plant-available ?p)
	)
	(:action make-papyrus
		:parameters (?m - material ?p - papyrusplant ?pp - papyruspaper)
		:precondition (and (material-available ?m) (plant-available ?p) (not (made-paper ?pp)))
		:effect (made-paper ?pp)
	)
)