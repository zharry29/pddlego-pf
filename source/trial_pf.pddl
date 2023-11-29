(define (problem exploration)
  (:domain environment)
  (:objects
    kitchen - location
    north south east west - direction
    backyard - location
    loc2 - location
    backyard - location
    driveway - location
    street - location
    loc3 - location
    loc4 - location
  )
  (:init
    (at street)
    (visited kitchen)
    (connected kitchen backyard south)
    (connected kitchen loc2 west)
    (closed_door kitchen loc2)
    (visited backyard)
    (connected backyard kitchen north)
    (connected backyard driveway south)
    (connected backyard street east)
    (connected backyard loc3 west)
    (closed_door backyard loc3)
    (visited driveway)
    (connected driveway backyard north)
    (connected street backyard west)
    (connected street loc4 north)
    (closed_door street loc4)
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