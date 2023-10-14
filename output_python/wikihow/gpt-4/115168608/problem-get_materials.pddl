Sure, here is a PDDL problem file for the task "get materials":

```
(define (problem get-materials)
(:domain make-papyrus-paper)
(:objects
 scissors - tool
 green-papyrus - material
 water - water
)
(:init
 (has-tool scissors)
)
(:goal
 (and (has-material-to-make-paper green-papyrus) (has-water water))
)
)
```
In this problem file, "scissors" is defined as a tool, "green-papyrus" is a material, and "water" is a water object. The goal is to obtain both the green-papyrus material and water.