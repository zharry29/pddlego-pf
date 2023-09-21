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