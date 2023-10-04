(define (domain caffeine_drink)
 (:requirements :strips)
 (:predicates
  (at ?x) ;the current location
  (drink ?x ?loc) ;the location of the dink
  (holding ?x) ;the drink the robot is holding
 )
 (:action find
  :parameters (?x ?loc)
  :precondition (and (at ?loc) (drink ?x ?loc))
  :effect (holding ?x)
 )

 (:action go
  :parameters (?loc)
  :precondition (not (at ?loc))
  :effect (and (at ?loc) (not (at (not ?loc))))
 )
 
 (:action pick
  :parameters (?x ?loc)
  :precondition (and (at ?loc) (drink ?x ?loc) (not (holding ?x)))
  :effect (holding ?x)
 )
 
 (:action put
  :parameters (?x ?loc)
  :precondition (and (at ?loc) (holding ?x))
  :effect (not (holding ?x))
 )
)
