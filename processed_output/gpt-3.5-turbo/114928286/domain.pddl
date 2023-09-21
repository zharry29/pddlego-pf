(define (domain amaze-domain)
  (:requirements :strips :typing)
  
  ;; Types
  (:types food item)
  
  ;; Predicates
  (:predicates
   (long ?x - food)
   (thin ?x - food)
   (hard ?x - food)
   (straight ?x - food)
   (stiff ?x - food)
   (size-optimal ?x - food)
   (same-size ?x - food ?y - food)
   (position ?x - item)
   (crossed ?x - item)
   (at-rest ?x - item)
   (has-thrown ?x - item)
   (has-tick ?x - item)
   (has-cross ?x - item)
   (has-toss ?x - item)
   (has-materials))
  
  ;; Actions
  (:action select-food
   :parameters (?x - food)
   :precondition (and (long ?x)
                      (thin ?x)
                      (hard ?x)
                      (straight ?x)
                      (stiff ?x)
                      (size-optimal ?x))
   :effect (has-materials))
  
  (:action select-spot
   :parameters (?x - item ?y - item ?z - item)
   :precondition (and (position ?x)
                      (position ?y)
                      (position ?z))
   :effect (and (not (crossed ?x))
                (not (crossed ?y))
                (not (crossed ?z))))
  
  (:action measure-projectile
   :parameters (?x - item)
   :precondition (and (position ?x)
                      (same-size ?x ?y))
   :effect (and (not (at-rest ?x))
                (not (crossed ?x))
                (has-thrown ?x)
                (has-tick ?x)
                (has-cross ?x)
                (has-toss ?x)))
  
  (:action lay-tape-strips
   :parameters (?x - item)
   :precondition (same-size ?x ?y)
   :effect (and (not (crossed ?x))
                (not (at-rest ?x))
                (not (has-tick ?x))
                (not (has-cross ?x))
                (not (has-toss ?x))))
  
  (:action toss-food
   :parameters (?x - item)
   :precondition (and (position ?x)
                      (has-materials)
                      (has-thrown ?x)
                      (at-rest ?x))
   :effect (and (crossed ?x)
                (has-cross ?x)
                (has-toss ?x)
                (not (at-rest ?x))
                (not (has-thrown ?x))))
  
  (:action cleanup
   :parameters (?x - item)
   :precondition (and (position ?x)
                      (crossed ?x)
                      (at-rest ?x))
   :effect (and (not (at-rest ?x))
                (not (crossed ?x))
                (not (has-cross ?x))
                (not (has-toss ?x)))))