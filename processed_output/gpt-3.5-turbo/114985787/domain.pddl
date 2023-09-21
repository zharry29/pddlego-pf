(define (domain survival-tasks)

  (:requirements :strips :typing)
  
  (:types
    location object - physical_object
    shelter animal plant - object
    water - liquid_object
    tool - object
  )
  
  (:predicates
    (at ?obj - object ?loc - location)
    (collected ?obj - object)
    (treated ?water - water)
    (purified ?water - water)
    (has-tool ?tool - tool)
    (safe-plant ?plant - plant)
    (edible-plant ?plant - plant)
    (caught ?animal - animal)
    (has-water ?loc - location)
    (has-branch ?loc - location)
    (has-log ?loc - location)
    (has-tinder ?loc - location)
    (has-kindling ?loc - location)
    (has-fuel ?loc - location)
    (has-fire ?loc - location)
    (has-smoke ?loc - location)
    (has-shelter ?loc - location)
    (has-bed ?loc - location)
    (has-snare ?loc - location)
  )
  
  (:action collect-tool
    :parameters (?tool - tool ?loc - location)
    :precondition (and (at ?tool ?loc))
    :effect (and (collected ?tool)
                 (at ?tool ?loc))
  )
  
  (:action treat-water
    :parameters (?water - water ?loc - location)
    :precondition (and (at ?water ?loc))
    :effect (and (treated ?water)
                 (at ?water ?loc))
  )
  
  (:action purify-water
    :parameters (?water - water ?loc - location)
    :precondition (and (at ?water ?loc)
                      (collected ?water)
                      (treated ?water))
    :effect (and (purified ?water)
                 (at ?water ?loc))
  )
  
  (:action find-plants
    :parameters (?plant - plant ?loc - location)
    :precondition (and (at ?loc - location)
                      (safe-plant ?plant)
                      (edible-plant ?plant))
    :effect (and (collected ?plant)
                 (at ?plant ?loc))
  )
  
  (:action build-shelter
    :parameters (?shelter - shelter ?loc - location)
    :precondition (and (at ?shelter ?loc)
                      (has-tool ?loc)