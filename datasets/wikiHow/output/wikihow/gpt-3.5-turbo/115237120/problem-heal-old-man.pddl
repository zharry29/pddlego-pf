(define (problem heal-old-man)
  (:domain war-survival)
  (:objects
    old-man doctor - person
    hospital town1 town2 - place
    medicine - resource
  )
  (:init
    (at old-man town1)
    (alive old-man)
    (healthy old-man)
    (at doctor hospital)
    (alive doctor)
    (can-use doctor medicine)
  )
  (:goal (and
    (healthy old-man)
  ))
)