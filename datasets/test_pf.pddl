(define (problem kitchen-problem)
  (:domain kitchen)
  (:objects
    kitchen pantry - location
    l1 l2 - location
    north south east west - direction
    d1 d2 - door
  )
  (:init
    (at pantry)
    (visited kitchen)
    (visited pantry)
    (door d1 kitchen l1 south)
    (door d2 pantry kitchen south)
    (open d2)
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