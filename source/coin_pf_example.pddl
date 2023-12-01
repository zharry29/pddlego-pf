(define (problem exploration)
  (:domain environment)
  (:objects
    kitchen - location
    north south east west - direction
    backyard - location
    loc5 - location
    driveway - location
    street - location
    loc6 - location
    supermarket - location
  )
  (:init
    (visited kitchen)
    (connected kitchen backyard south)
    (closed_door kitchen backyard)
    (connected kitchen loc5 west)
    (closed_door kitchen loc5)
    (visited backyard)
    (connected backyard kitchen north)
    (connected backyard driveway south)
    (connected backyard street east)
    (connected backyard loc6 west)
    (closed_door backyard loc6)
    (visited driveway)
    (connected driveway backyard north)
    (at street)
    (visited street)
    (connected street backyard west)
    (connected street supermarket north)
    (closed_door street supermarket)
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