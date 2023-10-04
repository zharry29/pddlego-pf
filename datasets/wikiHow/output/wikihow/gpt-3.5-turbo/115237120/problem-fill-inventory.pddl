(define (problem fill-inventory)
  (:domain war-survival)
  (:objects
    bob - person
    home city1 city2 city3 - place
    money canned-food bottled-water hygiene-products - resource
  )
  (:init
    (at bob home)
    (alive bob)
    (healthy bob)
    (has-id bob)
  )
  (:goal (and
    (has bob money)
    (has bob canned-food)
    (has bob bottled-water)
    (has bob hygiene-products)
  ))
)