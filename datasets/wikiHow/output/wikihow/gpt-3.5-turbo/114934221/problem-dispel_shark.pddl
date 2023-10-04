Sure! Here is the PDDL code for the third problem file "ispel shark":

```pddl
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
```

In this problem, the goal is to successfully dispel the shark by preventing it from attacking and ensuring the swimmer's safety. The initial state specifies the presence of the swimmer and the shark, and that the swimmer can see the shark. The goal state requires that the shark is not attacking, the swimmer is not injured, and the swimmer is not in the water.