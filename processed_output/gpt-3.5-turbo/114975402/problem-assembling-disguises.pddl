(define (problem assembling-disguises)
  (:domain detective-kit)
  (:objects 
    person - person
    alias1 alias2 alias3 - alias
    disguise1 disguise2 disguise3 - disguise
    item1 item2 item3 item4 item5 - item)
  (:init 
    (not (has_alias person alias1))
    (not (has_alias person alias2))
    (not (has_alias person alias3))
    (not (has_costume alias1 item1))
    (not (has_costume alias2 item2))
    (not (has_costume alias3 item3))
    (not (has_accessory disguise1 item1))
    (not (has_accessory disguise2 item2))
    (not (has_accessory disguise3 item3))
  )
  (:goal 
    (and 
      (not (has_alias person alias1))
      (not (has_alias person alias2))
      (not (has_alias person alias3))
      (not (has_costume alias1 item1))
      (not (has_costume alias2 item2))
      (not (has_costume alias3 item3))
      (not (has_accessory disguise1 item1))
      (not (has_accessory disguise2 item2))
      (not (has_accessory disguise3 item3))
      (has_part disguise1 item1)
      (has_part disguise2 item2)
      (has_part disguise3 item3))
  )
)