(define
	(problem party3)
	(:domain party)
	(:objects
		dlanterns danime_faces dcostumes - decoration
	)
	(:init )
	(:goal (and (decoration-complete dlanterns) (decoration-complete danime-faces) (decoration-complete dcostumes)))
)
