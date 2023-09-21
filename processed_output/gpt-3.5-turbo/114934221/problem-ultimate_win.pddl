(define (problem ultimate-win)
   (:domain shark-defense)

   (:objects
      swimmer - person
      shark - shark
   )

   (:init
      (at swimmer)
      (at shark)
   )

   (:goal
      (and
         (not (attacking shark))
         (not (injured swimmer))
         (reached-shore)
         (medical-attention swimmer)
      )
   )
)