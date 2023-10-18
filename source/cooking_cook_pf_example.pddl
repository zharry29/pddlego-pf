(define (problem cook)
  (:domain environment)
  (:objects
    kitchen - location
    north south east west - direction
    pork_chop - ingredient
    fridge - container
    toaster - toaster
  )
  (:init
    (at kitchen)
    (visited kitchen)
    (tool_at fridge kitchen)
    (contain fridge pork_chop)
    (tool_at toaster kitchen)
  )
  (:goal 
    (and
        (have pork_chop)
    )
  )
)