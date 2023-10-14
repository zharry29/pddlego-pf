(define
	(problem junglesurvival1)
	(:domain junglesurvival)
	(:objects
		explorer1 - human
		shelter1 - shelter
		water_source1 - water
	)
	(:init )
	(:goal (and (has-water explorer1 water-source1) (at-shelter explorer1 shelter1)))
)
