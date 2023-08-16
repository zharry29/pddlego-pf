Sure, here is the PDDL code for the first problem file "ard shi":

```pddl
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
```

In this problem, the goal is to reach the shore while avoiding the shark's attack. The initial state specifies that the shark is present. The goal state requires that the shark is not attacking, not injured, and the person has safely reached the shore.