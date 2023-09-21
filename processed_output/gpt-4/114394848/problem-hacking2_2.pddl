(define (problem hacking2-2) 
    (:domain hacking)
    (:objects 
        Hacker - user 
        Computer1 - computer
        Computer2 - computer
        Admin - user
    )
    (:init
        (setup Hacker)
        (access Computer1 Hacker)
        (access Computer2 Hacker)
        (access Computer1 Admin)
        (access Computer2 Admin)
        (passwordCracked Admin)
        (superUserPrivileges Admin)
        (backdoorCreated Computer1)
        (backdoorCreated Computer2)
    )
    (:goal (and (hacked Computer1) (hacked Computer2)))
)