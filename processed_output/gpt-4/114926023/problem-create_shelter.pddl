(define (problem create-shelter)
    (:domain stranded-island)
    (:objects 
      Mary - person
     )
    (:init 
      (not (is-shelter-built Mary))
    )
    (:goal (is-shelter-built Mary))
)