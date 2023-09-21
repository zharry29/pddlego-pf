(define (problem prepare-meat)
    (:domain stranded-island)
    (:objects 
      Jane - person
      fish - meat
    )
    (:init 
      (is-meat-obtained Jane)
      (not (is-meat-prepared fish))
    )
    (:goal (is-meat-prepared fish))
)