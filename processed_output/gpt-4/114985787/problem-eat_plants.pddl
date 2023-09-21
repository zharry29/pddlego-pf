(define (problem eat-plants)
  (:domain survival)
  (:objects
    player - object
    forest - location
    berry1 grass1 - plants)
  (:init
    (at player forest)
    (at berry1 forest)
    (at grass1 forest)
    (not (eaten berry1))
    (not (eaten grass1)))
  (:goal (and (eaten berry1) (eaten grass1))))