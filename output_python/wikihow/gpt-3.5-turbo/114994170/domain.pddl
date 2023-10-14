(define (domain emergency-preparedness)

	(:requirements :strips :typing)

	(:types
		action - object
		location - object
		radio - object
		food - object
		person - object
		vehicle - object
		electronic - object
		water-source - object
		item - object
		shelter - object
		communication-tool - object
		tool - object
		weapon - object
		disaster - object
		emergency - object
		medicine - object
		clothing - object
		first-aid-kit - object
		sanitary-item - object
		clock - object
		thermometer - object
		battery - object
		solar-panel - object
		home - location
		vehicle-trunk - location
		yard - location
		basement - location
		bottom-level - location
		underground - location
		room - location
		backyard-shed - location
		rock - location
		plant - location
		radio-station - location
		other-location - location
		municipal-water-system - location
		sheltered-location - location
		coldest-location - location
		Faraday-cage - location
		shelter-storage - shelter
		stockpile-location - location
		hidden-location - location
		preferred-location - location
		home-yard - location
		vehicle-trunk-storage - location
		area-with-access - location)

	(:predicates
		(at ?a - action ?l - location)
		(has ?p - person ?i - item)
		(has ?l - location ?i - item)
		(has ?l - location ?p - person)
		(has ?l - location ?c - communication-tool)
		(has ?l - location ?t - tool)
		(has ?l - location ?w - weapon)
		(needs-charging ?e - electronic)
		(has-power ?e - electronic)
		(working ?e - electronic)
		(needs ?p - person ?w - water-source)
		(potable ?w - water-source)
		(need ?p - person ?f - food)
		(fresh ?f - food)
		(food-to-eat ?f - food)
		(available ?f - food)
		(meets-nutritional-needs ?f - food)
		(consumed ?f - food ?p - person)
		(radio-on ?r - radio)
		(receive-information ?p - person ?r - radio ?l - location)
		(panic ?p - person)
		(safe-location ?p - person ?l - location)
		(locations ?p - person ?l1 - location ?l2 - location)
		(stay-in-place ?p - person)
		(if-mentioned-blast ?r - radio)
		(stay-indoors ?p - person)
		(stay-outdoors ?p - person)
		(take-backroads ?p - person)
		(drive-vehicle ?p - person)
		(family ?p1 - person ?p2 - person)
		(all-family-members-are-together ?p1 - person ?p2 - person ?f - food)
		(stay-off-roads ?p - person)
		(stay-out-of-vehicle ?p - person)
		(hybrid-vehicle ?v - vehicle)
		(drive-if-necessary ?p - person)
		(safe-to-drive ?p - person)
		(water-main-system-functioning ?l - location)
		(supply-water ?l1 - location ?l2 - location)
		(dehydrated ?p - person)
		(refrigerated-food ?f - food)
		(edible-after-power-outage ?f - food)
		(in-fridge ?f - food ?p - person)
		(food-gone-bad ?f - food)
		(food-needs-cooling ?f - food)
		(frozen-food ?f - food)
		(thawed-food ?f - food)
		(eat-thawed-food ?p - person)
		(need-disaster-plan ?p - person)
		(safety-meeting ?p1 - person ?p2 - person)
		(select-location ?p1 - person ?p2 - person ?l - location)
		(hidden-key ?l - location ?k - item)
		(household-pets ?p1 - person ?p2 - person)
		(seek-help ?p - person)
		(meet-up ?p1 - person ?p2 - person ?l - location)
		(has-plan-copy ?p - person)
		(stockpile-food ?l - location ?f - food)
		(stockpile-water ?l - location ?w - water-source)
		(stockpile-necessities ?l - location ?i - item)
		(enough-food-water ?l - location)
		(enough-stockpile ?l - location ?f - food)
		(enough-emergency-gear ?l - location ?i - item)
		(analog-device ?a - item)
		(gather-stocks ?l - location)
		(solar-powered-home ?l - location)
		(close-circuit ?l - location)
		(have-power ?l - location)
		(store-emergency-electronics ?l - location ?e - electronic)
		(have-safety-gear ?p - person)
		(have-weapon ?p - person)
		(use-weapon ?p1 - person ?p2 - person)
		(keep-weapon-safely ?p - person)
		(locked-gun-safe ?p - person)
		(radio-station-working ?l - location)
		(available-food-water ?l - location)
		(environmental-damage ?l - location))

	(:functions
		(temperature ?l - location)
		(time ?l - location)
		(requested-duration ?p - person)
		(total-amount ?p - person)
		(food-water-required ?p - person ?a - action)
		(distance ?l1 - location ?l2 - location)
		(number-of-persons ?p1 - person ?p2 - person))

	(:action collect-water
		:parameters (?p - person ?w - water-source ?l1 - location ?l2 - location ?d - disaster)
		:precondition (and (needs ?p ?w) (potable ?w) (water-main-system-functioning ?l1) (municipal-water-system ?l1) (supply-water ?l1 ?l2) (environmental-damage ?l1) (dehydrated ?p) (locations ?p ?l1 ?l2) (emergency ?d))
		:effect (and (not (needs ?p ?w)) (has ?p ?w) (potable ?w)))

	(:action get-home
		:parameters (?p - person ?l1 - location ?l2 - location ?d - disaster)
		:precondition (and (panic ?p) (safe-location ?p ?l1) (locations ?p ?l1 ?l2) (emergency ?d))
		:effect (and (not (panic ?p)) (safe-location ?p ?l2)))

	(:action prepare-for-attack
		:parameters (?p - person ?r - radio ?l - location ?s - shelter ?w - weapon ?d - disaster)
		:precondition (and (radio-on ?r) (receive-information ?p ?r ?l) (if-mentioned-blast ?r) (stay-indoors ?p) (stay-in-place ?p) (stay-outdoors ?p) (safe-location ?p ?l) (consume ?f ?p) (family ?p ?p) (family ?p ?s) (stay-in-place ?p) (stay-outdoors ?p) (stay-outdoors ?p) (family ?p ?p) (stay-in-place ?p) (stay-in-place ?p) (stay-in-place