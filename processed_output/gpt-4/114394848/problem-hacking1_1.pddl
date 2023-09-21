(define (problem hacking1-1) 
    (:domain hacking) 
    (:objects 
        Hacker - user 
        Computer1 - computer
    ) 
    (:init
        (setup Hacker)
        (access Computer1 Hacker)
    ) 
    (:goal (hacked Computer1))
)