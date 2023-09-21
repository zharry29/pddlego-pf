(define (problem ard-shi)
   (:domain shark-defense)

   (:objects
      shark - shark
   )

   (:init
      (at shark)
   )

   (:goal
      (and
         (not (attacking shark))
         (not (injured shark))
         (reached-shore)
      )
   )
)