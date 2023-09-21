(define (problem build-snare)
  (:domain survival)
  (:objects
    player - object
    jungle - location
    string1 stick1 - material
    animal-snare - snare)
  (:init
    (at player jungle)
    (at string1 jungle)
    (at stick1 jungle)
    (not (built animal-snare)))
  (:goal (built animal-snare)))