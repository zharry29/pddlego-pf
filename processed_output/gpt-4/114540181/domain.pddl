(define (domain jungle_survival)
(:requirements :strips :typing :negative-preconditions)
(:types
    human
    water_source - object
    shelter - object
    resource - object
)

(:predicates
    (dehydrated ?person - human)
    (hydrated ?person - human)
    (at_water_source ?person - human ?source - water_source)
    (has_shelter ?person - human ?shelter - shelter)
    (is_safe ?person - human)
    (has_resource ?person - human ?resource - resource)
    (is_fed ?person - human)
    (is_hungry ?person - human)
    (can_escape ?person - human)
)

(:action drink
    :parameters (?person - human ?source - water_source)
    :precondition (and (dehydrated ?person) (at_water_source ?person ?source))
    :effect (and (not (dehydrated ?person)) (hydrated ?person))
)

(:action build_shelter
    :parameters (?person - human ?shelter - shelter)
    :precondition (and (not (has_shelter ?person ?shelter)) (has_resource ?person ?shelter))
    :effect (has_shelter ?person ?shelter)
)

(:action hunt_food
    :parameters (?person - human ?resource - resource)
    :precondition (and (is_hungry ?person) (has_resource ?person ?resource)) 
    :effect (and (not (is_hungry ?person)) (is_fed ?person))
)

(:action escape
    :parameters (?person - human)
    :precondition (and (is_safe ?person) (can_escape ?person))
    :effect (and (not (at_jungle ?person))))
)