(define (problem get-strips)
(:domain Papyrus-production)

(:objects
    p1 - papyrus
    s1 - strips
)

(:init
    (papyrus p1)
    (not (strips s1))
)

(:goal 
    (strips s1))
)