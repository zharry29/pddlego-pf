(define (domain survival)
  (:requirements :strips :typing)
  (:types water food island object - physical_object
          container - object
          person - object
          location - object)
  (:predicates
   (at ?o - object ?l - location)
   (alive ?p - person)
   (holding ?p - person ?o - object)
   (cooked ?f - food)
   (poisoned ?f - food)
   (cleaned ?w - water)
   (made-fire)
   (on-island)
   (survived))

  (:action catch-fish
   :parameters (?p - person ?f - fish ?l - location)
   :precondition (and (alive ?p) (at ?p ?l) (at ?f ?l))
   :effect (and (not (holding ?p ?f)) (alive ?p) (at ?f ?l) (cooked ?f))))

  (:action cook-fish
   :parameters (?p - person ?f - fish)
   :precondition (and (alive ?p) (holding ?p ?f))
   :effect (and (not (holding ?p ?f)) (alive ?p) (cooked ?f))))

  (:action drink-water
   :parameters (?p - person ?w - water)
   :precondition (and (alive ?p) (holding ?p ?w))
   :effect (and (not (holding ?p ?w)) (alive ?p) (cleaned ?w))))

  (:action escape-island
   :parameters (?p - person)
   :precondition (and (alive ?p) (on-island))
   :effect (and (not (on-island)) (survived)))

  (:action start-fire
   :parameters (?p - person)
   :precondition (alive ?p)
   :effect (made-fire)))