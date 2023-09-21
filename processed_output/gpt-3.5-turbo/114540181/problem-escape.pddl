(define (problem escape)
  (:domain survival)
  
  (:objects 
    stream1 - stream
    container1 - container
    container2 - container
    fabric1 - fabric
    fabric2 - fabric
    river1 - river
    fruit1 - fruit
    animal1 - animal
    animal2 - animal
    animal3 - animal
  )
  
  (:init 
    (rainfall_collected stream1)
    (water_bottle_filled container1)
    (not (water_bottle_filled container2))
    (not (water_filtered))
    (fruit_recognized fruit1)
    (fruit_collected fruit1)
    (animals_trapped animal1)
    (not (animals_trapped animal2))
    (not (animals_trapped animal3))
    (not (animals_killed animal1))
    (not (animals_killed animal2))
    (not (animals_killed animal3))
    (not (animals_cooked animal1))
    (not (animals_cooked animal2))
    (not (animals_cooked animal3))
    (not (water_crossed))
  )
  
  (:goal 
    (not (escape))
  )
)