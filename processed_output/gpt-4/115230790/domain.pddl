(define (domain comet-impact)
(:requirements :strips :typing)
(:types
person place object
)
(:predicates
(at ?p - person ?pl - place)
(in_bunker ?p - person)
(has ?p - person ?o - object)
(heard_prediction ?p - person)
(moved ?p - person)
)
(:action listen_to_prediction
:parameters (?p - person)
:precondition (at ?p - person ?pl - place)
:effect (heard_prediction ?p)
)

(:action move_to_bunker
:parameters (?p - person ?b - place)
:precondition (and (at ?p - person ?pl - place) 
(heard_prediction ?p))
:effect (and (in_bunker ?p) (not (at ?p ?pl)) (at ?p ?b) (moved ?p))
)
)