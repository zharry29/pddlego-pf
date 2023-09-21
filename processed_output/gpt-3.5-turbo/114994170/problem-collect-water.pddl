(define (problem collect-water-problem)
	(:domain emergency-preparedness)

	(:objects
		person1 - person
		water-source1 - water-source
		location1 - location
		location2 - location
		disaster1 - disaster)

	(:init
		(needs person1 water-source1)
		(potable water-source1)
		(water-main-system-functioning location1)
		(municipal-water-system location1)
		(supply-water location1 location2)
		(environmental-damage location1)
		(dehydrated person1)
		(locations person1 location1 location2)
		(emergency disaster1))

	(:goal
		(and
			(not (needs person1 water-source1))
			(has person1 water-source1)
			(potable water-source1))))