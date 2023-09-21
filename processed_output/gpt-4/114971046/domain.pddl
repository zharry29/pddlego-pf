(define (domain survival)
(:requirements :strips :typing)
(:types 
person food medical_supply water communication_supply other_supply)
(:predicates 
(essential_items ?p - person)
(inforce_basement ?p - person)
(stay_sheltered_with_food ?p - person ?f - food)
(has_food ?p - person ?f - food)
(has_water ?p - person ?w - water)
(has_medical_supply ?p - person ?m - medical_supply)
(has_communication_supply ?p - person ?c - communication_supply)
(has_other_supply ?p - person ?o - other_supply))
(:action get_essential_items
:parameters (?p - person ?f - food ?m - medical_supply ?w - water ?c - communication_supply ?o - other_supply)
:precondition (and (has_food ?p ?f) (has_water ?p ?w) (has_medical_supply ?p ?m) (has_communication_supply ?p ?c) (has_other_supply ?p ?o))
:effect (essential_items ?p))
(:action inforce_basement
:parameters (?p - person)
:effect (inforce_basement ?p))
(:action stay_sheltered_with_food
:parameters (?p - person ?f - food)
:precondition (and (has_food ?p ?f) (inforce_basement ?p))
:effect (stay_sheltered_with_food ?p ?f)))