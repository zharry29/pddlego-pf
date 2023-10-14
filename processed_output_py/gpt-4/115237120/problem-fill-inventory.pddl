(define
	(problem fillinventory)
	(:domain warsurvival)
	(:objects
		lhome lstore - location
		p1 - person
		sfood smedicine - supplies
	)
	(:init (at p1 lhome) (exists sfood) (exists smedicine))
	(:goal (and (has p1 sfood) (has p1 smedicine)))
)
