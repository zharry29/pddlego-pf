(define (problem eat-fish)
  (:domain jungle_survival)
  (:objects
    fishing-spear - tool
    fish - creature
  )
  (:init 
    (has-tool fishing-spear)
    (has-food fish)
  )
  (:goal 
    (eat-fish)
  )
)