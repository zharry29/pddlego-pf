(define (domain robot-domain)
    (:requirements :strips)
    (:predicates 
        (at ?x)
        (empty-hand ?x)
    )
    (:action Find
        :parameters (?x)
        :precondition (empty-hand)
        :effect (and (not (empty-hand)) (at ?x))
    )
    (:action Go
        :parameters (?x ?y)
        :precondition (and (at ?x))
        :effect (and (not (at ?x)) (at ?y))
    )
   (:action Pick
        :parameters (?x)
        :precondition (at ?x)
        :effect (not (at ?x))
    )
   (:action Put
        :parameters (?x)
        :precondition (not (empty-hand))
        :effect (and (empty-hand) (at ?x))
    )
)
