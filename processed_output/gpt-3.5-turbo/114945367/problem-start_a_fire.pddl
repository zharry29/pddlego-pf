(define (problem start-fire)
  (:domain survival-guide)
  (:objects
    fire1 - fire
    firewood1 firewood2 - firewood
    location1 location2 - location)
  (:init
    (at firewood1 location1)
    (at firewood2 location2))
  (:goal
    (started fire1)))