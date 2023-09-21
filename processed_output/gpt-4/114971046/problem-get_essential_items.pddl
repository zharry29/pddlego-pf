(define (problem get_items)
(:domain survival)
(:objects 
john - person
rice beans honey - food
bandages ointment - medical_supply
distilled_water - water
radio_cellphone - communication_supply
flashlight dust_mask - other_supply)
(:init 
(has_food john rice)
(has_food john beans)
(has_food john honey)
(has_medical_supply john bandages)
(has_medical_supply john ointment)
(has_water john distilled_water)
(has_communication_supply john radio_cellphone)
(has_other_supply john flashlight)
(has_other_supply john dust_mask))
(:goal (essential_items john)))