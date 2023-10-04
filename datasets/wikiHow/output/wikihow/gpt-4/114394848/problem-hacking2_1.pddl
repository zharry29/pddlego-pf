Sure, here is the PDDL problem file "hacking2 1":

```lisp
(define (problem hacking2-1) 
    (:domain hacking) 
    (:objects 
        Hacker - user 
        Computer1 - computer
        Computer2 - computer
    ) 
    (:init
        (setup Hacker)
        (access Computer1 Hacker)
        (access Computer2 Hacker)
    ) 
    (:goal (and (hacked Computer1) (hacked Computer2)))
)
```