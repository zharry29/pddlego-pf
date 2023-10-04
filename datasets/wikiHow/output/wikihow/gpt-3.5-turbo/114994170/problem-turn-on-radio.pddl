(define (problem turn-on-radio-problem)
	(:domain emergency-preparedness)

	(:objects
		person1 - person
		radio1 - radio
		disaster1 - disaster)

	(:init
		(radio1 radio)
		(locations person1 radio1 location1)
		(radio-station-working location1))

	(:goal
		(receive-information person1 radio1 location1)))