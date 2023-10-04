```lisp
(define (problem move-to-bunker)
  (:domain comet-survival)
  (:objects
    person - object
    bunker - location
    fortified-structure - location
    energy-source - object
    heat - object
    generator - object
    fuel - object
    blast - object
    cave - location
  )
  (:init
    (defend-yourself person)
    (safe bunker)
    (safe fortified-structure)
    (communication bunker)
    (communication fortified-structure)
  )
  (:goal
    (at person bunker)
    (protect-from-environment person)
    (outfit-with-energy-source bunker)
    (outfit-with-energy-source fortified-structure)
  )
)
```

