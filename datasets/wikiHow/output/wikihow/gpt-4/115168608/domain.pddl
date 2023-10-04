Sure, here is a PDDL domain file for making paper from a papyrus plant:

```
(define (domain make-papyrus-paper)

(:requirements :strips :typing)

(:types
 tool - object
 material - object
 water - object
 paper-sheet - object
 papyrus-sheet - object
 strip - object
)

(:predicates
 (has ?o - object)
 (has-material-to-make-paper ?m - material)
 (has-water ?w - water)
 (has-strip ?s - strip)
 (has-tool ?t - tool)
)

(:action get-materials
 :parameters (?t - tool ?m - material ?w - water)
 :precondition (and (has-tool ?t) (has-material-to-make-paper ?m) (has-water ?w))
 :effect (and (has-tool ?t) (has-material-to-make-paper ?m) (has-water ?w))
)

(:action get-papyrus-plant
 :parameters ()
 :effect (has-material-to-make-paper papyrus)
)

(:action make-paper
 :parameters (?m - material ?s - strip ?w - water ?t - tool ?p - papyrus-sheet)
 :precondition (and (has-material-to-make-paper ?m) (has-strip ?s) (has-water ?w) (has-tool ?t))
 :effect (has ?p)
)
)
```

This domain file contains the basic elements needed to make papyrus paper, including acquiring the materials and tools, getting the papyrus plant, and making the paper itself.
