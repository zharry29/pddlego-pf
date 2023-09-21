(define (domain quicksand)
    (:requirements :strips :typing)
 
    (:types position tool)
 
    (:predicates
        (is-stuck ?pos - position)
        (is-deep ?pos - position)
        (has-tool ?t - tool)
        (freed ?pos - position)
    )
 
    (:action remove-heavy-item
        :parameters (?pos - position)
        :precondition (is-stuck ?pos)
        :effect (and
            (not (is-stuck ?pos))
        )
    )

    (:action walk-back
        :parameters (?pos - position)
        :precondition (is-stuck ?pos)
        :effect (and
            (not (is-stuck ?pos))
        )
    )
  
    (:action lay-back
        :parameters (?pos - position)
        :precondition (is-stuck ?pos)
        :effect (and
            (not (is-stuck ?pos))
        )
    )
  
    (:action move-slowly
        :parameters (?pos - position)
        :precondition (is-deep ?pos)
        :effect (and
            (not (is-deep ?pos))
        )
    )
  
    (:action swim-back
        :parameters (?pos - position)
        :precondition (is-deep ?pos)
        :effect (and
            (not (is-deep ?pos))
        )
    )
    
    (:action use-stick
        :parameters (?pos - position ?t - tool)
        :precondition (and (is-deep ?pos) (has-tool ?t))
        :effect (and
            (not (is-deep ?pos))
            (freed ?pos)
        )
    )
)