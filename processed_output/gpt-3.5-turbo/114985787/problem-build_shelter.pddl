(define (problem build-shelter)

  (:domain survival-tasks)
  
  (:objects
    shack - shelter
    shed - shelter
    garden - location
    basement - location
    toolbox - tool
    bed - object
    firepit - location
    woodpile - location
  )
  
  (:init
    (at shack garden)
    (at shed garden)
    (at toolbox garden)
    (at bed garden)
    (at firepit garden)
    (at woodpile garden)
    (has-tool toolbox)
    (has-bed bed)
  )
  
  (:goal
    (has-shelter garden)
    (has-bed garden)
  )
)