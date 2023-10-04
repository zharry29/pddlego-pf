(define (problem throw-hotdogs-problem)
  (:domain amaze-domain)
  
  (:objects
   frozen-hot-dog-1 - item
   frozen-hot-dog-2 - item
   frozen-hot-dog-3 - item
   spot1 - item
   spot2 - item
   spot3 - item)
  
  (:init
   (position spot1)
   (position spot2)
   (position spot3)
   (same-size frozen-hot-dog-1 frozen-hot-dog-2)
   (same-size frozen-hot-dog-1 frozen-hot-dog-3)
   (has-materials)
   (not (crossed frozen-hot-dog-1))
   (not (crossed frozen-hot-dog-2))
   (not (crossed frozen-hot-dog-3))
   (not (at-rest frozen-hot-dog-1))
   (not (at-rest frozen-hot-dog-2))
   (not (at-rest frozen-hot-dog-3))
   (not (has-thrown frozen-hot-dog-1))
   (not (has-thrown frozen-hot-dog-2))
   (not (has-thrown frozen-hot-dog-3))
   (not (has-tick frozen-hot-dog-1))
   (not (has-tick frozen-hot-dog-2))
   (not (has-tick frozen-hot-dog-3))
   (not (has-cross frozen-hot-dog-1))
   (not (has-cross frozen-hot-dog-2))
   (not (has-cross frozen-hot-dog-3))
   (not (has-toss frozen-hot-dog-1))
   (not (has-toss frozen-hot-dog-2))
   (not (has-toss frozen-hot-dog-3)))
  
  (:goal (and (forall (?x - item)
                      (or (crossed ?x)
                          (not (has-toss ?x))
                          (not (has-cross ?x))
                          (not (has-thrown ?x))))
               (not (at-rest frozen-hot-dog-1))
               (not (at-rest frozen-hot-dog-2))
               (not (at-rest frozen-hot-dog-3))
               (not (has-thrown frozen-hot-dog-1))
               (not (has-thrown frozen-hot-dog-2))
               (not (has-thrown frozen-hot-dog-3))
               (not (has-tick frozen-hot-dog-1))
               (not (has-tick frozen-hot-dog-2))
               (not (has-tick frozen-hot-dog-3))
               (not (has-cross frozen-hot-dog-1))
               (not (has-cross frozen-hot-dog-2))
               (not (has-cross frozen-hot-dog-3))
               (not (has-toss frozen-hot-dog-1))
               (not (has-toss frozen-hot-dog-2))
               (not (has-toss frozen-hot-dog-3)))))
  
  (:metric minimize (total-cost)))