(define (problem avoid-quicksand)
  (:domain quicksand-escape)
  (:objects 
    person - object
    backpack - object
    shoes - object
    stick - object
    loc1 loc2 - location
  )
  (:init
    (at person loc1)
    (wearing-backpack person)
    (at backpack loc1)
    (carrying person backpack)
    (at shoes loc1)
    (at stick loc1)
    (ground-unstable loc1)
    (water-seeping loc1)
    (test-ground loc1)
  )
  (:goal (and (not (in-quicksand person))
             (not (feet-stuck person))
             (not (held-stick person shoes))))
)