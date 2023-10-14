(define (problem get-out-deep)
  (:domain quicksand-escape)
  (:objects
    person - object
    shoes - object
    stick - object
    loc1 loc2 - location
  )
  (:init
    (at person loc1)
    (in-quicksand person)
    (at shoes loc1)
    (ground-unstable loc1)
    (slow-movement person)
    (feet-stuck person)
  )
  (:goal (and (not (feet-stuck person))
             (not (held-stick person shoes))
             (not (in-quicksand person))))
)