(define (problem survive-em)
    (:domain survive-emp)
    (:objects
        john - person)
    (:init
      (not (survived-emp john))
      (water-collected)
      (ready-for-attack john))
    (:goal
        (survived-emp john)))