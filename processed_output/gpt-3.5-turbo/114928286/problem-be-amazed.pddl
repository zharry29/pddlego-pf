(define (problem amaze-problem)
  (:domain amaze-domain)
  
  (:objects
   frozen-hot-dog - food
   otter-pops - food
   celery - food
   churros - food
   spot1 - item
   spot2 - item
   spot3 - item)
  
  (:init
   (long frozen-hot-dog)
   (thin frozen-hot-dog)
   (hard frozen-hot-dog)
   (straight frozen-hot-dog)
   (stiff frozen-hot-dog)
   (size-optimal frozen-hot-dog)
   (long otter-pops)
   (thin otter-pops)
   (hard otter-pops)
   (straight otter-pops)
   (stiff otter-pops)
   (size-optimal otter-pops)
   (long celery)
   (thin celery)
   (hard celery)
   (straight celery)
   (stiff celery)
   (size-optimal celery)
   (long churros)
   (thin churros)
   (hard churros)
   (straight churros)
   (stiff churros)
   (size-optimal churros)
   (position spot1)
   (position spot2)
   (position spot3))
  
  (:goal
   (forall (?x - item)
           (or (crossed ?x)
               (not (has-toss ?x))
               (not (has-cross ?x))
               (not (has-thrown ?x))))))
  
  (:metric minimize (total-cost)))