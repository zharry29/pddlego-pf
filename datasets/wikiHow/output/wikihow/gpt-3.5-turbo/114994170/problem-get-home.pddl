(define (problem get-home-problem)
	(:domain emergency-preparedness)

	(:objects
		person1 - person
		location1 - location
		location2 - location
		disaster1 - disaster)

	(:init
		(panic person1)
		(safe-location person1 location1)
		(locations person1 location1 location2)
		(emergency disaster1))

	(:goal
		(and
			(not (panic person1))
			(safe-location person1 location2))))