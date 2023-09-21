(define (problem build-shelter)
  (:domain survival)
  (:objects 
    player - object
    forest glade - location
    stick3 stick4 leaves1 - material
    makeshift-shelter - shelter)
  (:init 
    (at player forest)
    (at stick3 forest)
    (at stick4 forest)
    (at leaves1 forest)
    (not (built makeshift-shelter)))
  (:goal (and (built makeshift-shelter))))