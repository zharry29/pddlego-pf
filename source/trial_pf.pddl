(define (problem exploration)
  (:domain environment)
  (:objects
    kitchen - location
    north south east west - direction
    backyard
    backyard - location
    driveway - location
    street - location
  )
  (:init
    (visited kitchen)
    (connected kitchen backyard south)
    (connected kitchen loc2 west)
    (closed_door kitchen loc2)
    (at backyard)
    (visited backyard)
    (connected backyard kitchen north)
    (connected backyard driveway south)
    (connected backyard street east)
    (closed_door backyard loc2)
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