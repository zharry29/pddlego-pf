(define (domain coconut-tasks)
  (:requirements :strips)
  (:predicates
    (glass-filled)
    (meat-freed)
    (coconut-hit)
    (eyes-kept)
    (fiber-removed)
    (coconut-wrapped)
  )
  
  (:action fill-glass
    :parameters ()
    :precondition ()
    :effect (glass-filled)
  )
  
  (:action free-meat
    :parameters ()
    :precondition ()
    :effect (meat-freed)
  )
  
  (:action hit-coconut
    :parameters ()
    :precondition ()
    :effect (coconut-hit)
  )
  
  (:action keep-eyes
    :parameters ()
    :precondition ()
    :effect (eyes-kept)
  )
  
  (:action remove-fiber
    :parameters ()
    :precondition ()
    :effect (fiber-removed)
  )
  
  (:action wrap-coconut
    :parameters ()
    :precondition ()
    :effect (coconut-wrapped)
  )
)