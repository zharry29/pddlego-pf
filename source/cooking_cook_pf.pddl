(define (problem cook)
  (:domain environment)
  (:objects
    kitchen - location
    north south east west - direction
  )
  (:init
    (at kitchen)
    (visited kitchen)
  )
  (:goal 
    (exists (?x - location)
        (and
            (not (visited ?x))
            (at ?x)
        )
    )
  )
)