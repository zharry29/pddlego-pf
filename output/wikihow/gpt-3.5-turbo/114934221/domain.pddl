Sorry, but as an AI text-based model, I cannot directly generate files. However, I can provide you with the PDDL code for the domain file based on the given tasks. Here is the PDDL code for the domain file:

```pddl
(define (domain shark-defense)

   (:predicates
      (at ?x)
      (is-close ?x)
      (in-water)
      (can-see ?x)
      (blocking ?x)
      (defensive-position ?x)
      (attacking ?x)
      (injured ?x)
      (reached-shore)
      (reached-boat)
      (medical-attention)
   )

   (:action spot-shark
      :parameters ()
      :precondition ()
      :effect ()
   )

   (:action stay-calm
      :parameters ()
      :precondition ()
      :effect ()
   )

   (:action move-towards
      :parameters (?x)
      :precondition ()
      :effect ()
   )

   (:action avoid-blocking
      :parameters ()
      :precondition ()
      :effect ()
   )

   (:action keep-watching
      :parameters ()
      :precondition ()
      :effect ()
   )

   (:action get-into-position
      :parameters ()
      :precondition ()
      :effect ()
   )

   (:action hit-shark
      :parameters (?x)
      :precondition ()
      :effect ()
   )

   (:action keep-fighting
      :parameters (?x)
      :precondition ()
      :effect ()
   )

   (:action get-out-of-water
      :parameters ()
      :precondition ()
      :effect ()
   )

   (:action call-for-boat
      :parameters ()
      :precondition ()
      :effect ()
   )

   (:action swim-to-shore
      :parameters ()
      :precondition ()
      :effect ()
   )

   (:action get-medical-attention
      :parameters ()
      :precondition ()
      :effect ()
   )

)

```
This is a basic PDDL template for the domain file based on the given tasks. You will need to fill in the preconditions, effects, and parameters for each action according to your specific requirements.