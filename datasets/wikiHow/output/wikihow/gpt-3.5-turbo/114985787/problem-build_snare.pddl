(define (problem build-snare)

  (:domain survival-tasks)
  
  (:objects
    snare - object
    trail - location
    forest - location
    string - tool
    branch - object
  )
  
  (:init
    (at snare trail)
    (at string trail)
    (at branch forest)
    (has-tool string)
  )
  
  (:goal
    (has-snare trail)
  )
)
