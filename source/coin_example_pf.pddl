(define (problem exploration)
  (:domain environment)
  (:objects
    kitchen loc1 - location
    north south east west - direction
  )
  (:init
    (at kitchen)
    (visited kitchen)
    (connected kitchen loc1 west）
    (closed_door kitchen loc1 west）
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