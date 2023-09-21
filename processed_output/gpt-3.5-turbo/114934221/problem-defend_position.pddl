(define (problem efend-position)
   (:domain shark-defense)

   (:objects
      swimmer - person
      shark - shark
      reef - reef
      piling - piling
      rock-outcropping - rock-outcropping
   )

   (:init
      (at swimmer)
      (at shark)
   )

   (:goal
      (and
         (defensive-position swimmer)
      )
   )
)