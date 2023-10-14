(define (problem at-fish)
  (:domain jungle-survival)
  
  ; Objects
  (:objects fish1 fish2 spear1 spear2)
  
  ; Initial state
  (:init
    (fished fish1)
    (fished fish2)
    (speared fish1)
    (speared fish2)
    (pinned fish1)
    (pinned fish2)
  )
  
  ; Goal
  (:goal (and (caught fish1) (caught fish2)))
)
