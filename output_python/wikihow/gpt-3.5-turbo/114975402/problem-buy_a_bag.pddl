(define (problem buy-a-bag)
  (:domain detective-kit)
  (:objects 
    person - person
    bag - bag)
  (:init 
    (not (has_bag person bag))
  )
  (:goal 
    (has_bag person bag))
)
