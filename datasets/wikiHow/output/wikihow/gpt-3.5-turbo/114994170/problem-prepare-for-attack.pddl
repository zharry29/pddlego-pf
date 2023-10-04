(define (problem prepare-for-attack-problem)
	(:domain emergency-preparedness)

	(:objects
		person1 - person
		radio1 - radio
		location1 - location
		shelter1 - shelter
		weapon1 - weapon
		disaster1 - disaster)

	(:init
		(radio-on radio1)
		(receive-information person1 radio1 location1)
		(if-mentioned-blast radio1)
		(stay-indoors person1)
		(stay-in-place person1)
		(stay-outdoors person1)
		(safe-location person1 location1)
		(consumed food1 person1)
		(family person1 person1)
		(family person1 shelter1)
		(stay-in-place person1)
		(stay-outdoors person1)
		(stay-outdoors person1)
		(family person1 person1)
		(stay-in-place person1)
		(stay-in-place person1)
		(stay-in-place person1)
		(stay-indoors person1)
		(stay-indoors person1)
		(stay-outdoors person1)
		(store-emergency-electronics shelter1 radio1)
		(have-safety-gear person1)
		(have-weapon person1)
		(use-weapon person1 person1)
		(keep-weapon-safely person1)
		(locked-gun-safe person1)
		(radio-station-working location1)
		(available-food-water location1)
		(environmental-damage location1)
		(in-fridge food1 person1)
		(food-gone-bad food1)
		(frozen-food food1)
		(fresh food1)
		(potable water-source1))

	(:goal
		(and
			(not (panic person1))
			(not (safe-location person1 location1))
			(available-food-water location1)
			(radio-on radio1)
			(receive-information person1 radio1 location1)
			(if-mentioned-blast radio1)
			(stay-indoors person1)
			(safe-location person1 location1)
			(fresh food1)
			(not (food-gone-bad food1))
			(not (frozen-food food1))
			(potable water-source1))))