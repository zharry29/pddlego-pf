(define (problem get-all-stationery)
  (:domain detective-kit)
  (:objects 
    person - person
    notebook-bag - bag
    stationery - item)
  (:init 
    (not (has_bag person notebook-bag))
    (not (has_item notebook-bag stationery))
  )
  (:goal 
    (and
      (has_bag person notebook-bag)
      (not (has_item notebook-bag stationery))
      (has_item notebook-bag stationery))
  )
)