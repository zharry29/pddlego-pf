(define (problem cess-strips)
(:domain Papyrus-production)

(:objects
    p1 - papyrus
    s1 - strips
    c1 - cess-strips
)

(:init
    (papyrus p1)
    (strips s1)
    (not (cess-strips c1))
)

(:goal 
    (cess-strips c1))
)