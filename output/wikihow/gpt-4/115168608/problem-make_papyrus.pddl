Sure, here is a PDDL problem file for the task "make papyrus":

```
(define (problem make-papyrus)
(:domain make-papyrus-paper)
(:objects
 scissors - tool
 green-papyrus - material
 water - water
 strip - strip
 papyrus-sheet - papyrus-sheet
)
(:init
 (has-tool scissors)
 (has-material-to-make-paper green-papyrus)
 (has-water water)
)
(:goal 
 (has papyrus-sheet)
)
)
```

In this problem file, "scissors" is defined as a tool, "green-papyrus" is a material, "water" is water, "strip" is a strip, and "papyrus-sheet" is a papyrus-sheet. Initial conditions establish possession of scissors, papyrus material, and water. The goal is to produce a sheet of papyrus paper.