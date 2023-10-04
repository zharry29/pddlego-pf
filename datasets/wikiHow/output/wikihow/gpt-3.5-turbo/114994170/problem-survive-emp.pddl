(define (problem survive-em-problem)
	(:domain emergency-preparedness)

	(:objects
		person1 - person
		location1 - location
		radio1 - radio
		disaster1 - disaster)

	(:init
		(panic person1)
		(radio-on radio1)
		(receive-information person1 radio1 location1)
		(panic person1)
		(safe-location person1 location1)
		(radio-station-working location1)
		(environmental-damage location1)
		(food-gone-bad food1)
		(frozen-food food1)
		(potable water-source1))

	(:goal
		(and
			(not (panic person1))
			(safe-location person1 location1)
			(radio-on radio1)
			(receive-information person1 radio1 location1)
			(not (food-gone-bad food1))
			(not (frozen-food food1))
			(potable water-source1))))