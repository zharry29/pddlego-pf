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