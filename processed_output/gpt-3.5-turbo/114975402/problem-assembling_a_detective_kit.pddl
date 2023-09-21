(define (problem assembling-detective-kit)
  (:domain detective-kit)
  (:objects 
    person - person
    bag - bag
    new-bag - bag
    item1 item2 item3 item4 - item)
  (:init 
    (not (has_bag person bag))
    (not (has_item bag new-bag))
    (not (has_item bag item1))
    (not (has_item bag item2))
    (not (has_item bag item3))
    (not (has_item bag item4))
  )
  (:goal 
    (and 
      (has_bag person bag)
      (not (has_item bag new-bag))
      (has_item bag new-bag)
      (has_item bag item1)
      (has_item bag item2)
      (has_item bag item3)
      (has_item bag item4))
  )
)