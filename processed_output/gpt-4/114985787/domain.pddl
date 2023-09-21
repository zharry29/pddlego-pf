(define (domain survival)
  (:requirements :strips :typing)
  (:types 
    location - object
    material - object
    plants - object
    snare - object
    shelter - object)

  (:predicates 
    (at ?obj - object ?loc - location)
    (eaten ?obj - object)
    (built ?obj - object))

  (:action move
    :parameters (?obj - object ?from - location ?to - location)
    :precondition (at ?obj ?from)
    :effect (and (at ?obj ?to) (not (at ?obj ?from))))

  (:action eat
    :parameters (?plr - object ?plnt - plants)
    :precondition (and (at ?plr ?loc) (at ?plnt ?loc) (not (eaten ?plnt)))
    :effect (and (not (at ?plnt ?loc)) (eaten ?plnt)))

  (:action build_snare
    :parameters (?plr - object ?snr - snare ?mat - material)
    :precondition (and (at ?plr ?loc) (at ?mat ?loc) (not (built ?snr)))
    :effect (and (not (at ?mat ?loc)) (built ?snr)))
  
  (:action build_shelter
    :parameters (?plr - object ?shltr - shelter ?mat - material)
    :precondition (and (at ?plr ?loc) (at ?mat ?loc) (not (built ?shltr)))
    :effect (and (not (at ?mat ?loc)) (built ?shltr)))
)