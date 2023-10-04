(define (problem prepare-meat)
  (:domain survival-tasks)
  (:objects
    survivor1 - survivor
    island1 - island
    location1 location2 - location
    direction1 - direction)
  (:init
    (at survivor1 location1)
    (connected location1 location2))
  (:goal (meat-builtin)))