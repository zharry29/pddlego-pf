Sure, here is the generated problem PDDL file for task: create cult.

```
(define (problem create_cult)
    (:domain secret_society)
    (:objects 
        cult1 - friend
    )
    (:init
    )
    (:goal
        (and
            (secret_created cult1)
            (members_added cult1)
            (society_created cult1)
        )
    )
)
```