Sure, here is a PDDL problem file for the task "get papyrus plant":

```
(define (problem get-papyrus-plant)
(:domain make-papyrus-paper)
(:objects
 green-papyrus - material
)
(:init
)
(:goal
 (has-material-to-make-paper green-papyrus)
)
)
```

In this problem file, "green-papyrus" is defined as a material. The goal is to obtain the green-papyrus material.