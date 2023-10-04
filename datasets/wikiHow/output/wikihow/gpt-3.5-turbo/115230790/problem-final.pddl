```lisp
(define (problem fina)
  (:domain comet-survival)
  (:objects
    fina - location
    astronomers - object
    earth - location
    nasa-website - location
    predictions - object
    time - object
    preparation - object
  )
  (:init
    (at astronomers nasa-website)
    (safe earth)
    (communication fina)
  )
  (:goal
    (develop-sense-of-time predictions)
  )
)
```

