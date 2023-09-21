(define (problem ispel-shark)
   (:domain shark-defense)

   (:objects
      swimmer - person
      shark - shark
   )

   (:init
      (at swimmer)
      (at shark)
      (can-see swimmer)
   )

   (:goal
      (and
         (not (attacking shark))
         (not (injured swimmer))
         (not (in-water swimmer))
      )
   )
)