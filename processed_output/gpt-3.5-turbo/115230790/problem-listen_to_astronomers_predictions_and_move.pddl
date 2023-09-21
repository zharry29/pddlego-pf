(define (problem isten-and-move)
  (:domain comet-survival)
  (:objects
    person - object
    astronomers - object
    earth - location
    coastal-areas - location
    bunker - location
    energy-source - object
    structure - object
    blast - object
    cave - location
  )
  (:init
    (at astronomers earth)
    (safe coastal-areas)
    (safe bunker)
    (safe structure)
    (communication bunker)
    (communication coastal-areas)
    (communication structure)
  )
  (:goal
    (know-about-potential-collisions astronomers)
    (develop-sense-of-time predictions)
    (at person bunker)
  )
)