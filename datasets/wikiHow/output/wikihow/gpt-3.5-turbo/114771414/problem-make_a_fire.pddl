(define (problem make-fire)
  (:domain survival-island)
  (:objects 
    tools matches lighters sharpened-stick kindling-pile fire)
  (:init
    (has-tools)
    (dry-matches matches)
    (dry-matches lighters)
    (make-fire fire)
    (rub-stick sharpened-stick kindling-pile)
    (rub-stick kindling-pile fire)
  )
  (:goal
    (make-fire fire)
  )
)