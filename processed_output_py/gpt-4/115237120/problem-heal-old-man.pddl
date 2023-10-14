(define
	(problem healoldman)
	(:domain warsurvival)
	(:objects
		lhome - location
		pman poldman - person
		smedicine - supplies
	)
	(:init (at pman lhome) (is-alive poldman) (has pman smedicine))
	(:goal (and (is-alive poldman) (not (has pman smedicine))))
)
