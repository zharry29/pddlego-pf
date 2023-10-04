Sure, here you go:

```Lisp
(define (domain papyrus-making)

(:requirements :strips :typing)

(:types 
    strip water glue_paper towel plant board book stone shell
    - object
)

(:predicates
    (has ?o - object)
    (soaked ?o - strip)
    (stripped ?o - plant)
    (peeled ?o - plant)
    (rolled ?o - strip)
    (laid ?o - strip)
    (pressed ?o - object)
    (polished ?o - strip)
    (dried ?o - strip)
    (cut ?o - strip)
    (has_glue ?o - glue_paper)
    (torn ?obj - object)
    (dipped ?obj -  strip)
)

(:action obtain_plant
    :parameters (?p - plant)
    :effect (and 
        (has ?p)
    )
)

(:action strip_plant
    :parameters (?p - plant)
    :precondition (has ?p)
    :effect (and 
        (stripped ?p)
        (not (has ?p))
    )
)

(:action peel_plant
    :parameters (?p - plant)
    :precondition (stripped ?p)
    :effect (and 
        (peeled ?p)
    )
)

(:action soak_strip
    :parameters (?s - strip ?w - water)
    :precondition (and 
        (peeled ?s) 
        (has ?w)
    )
    :effect (soaked ?s)
)

(:action flatten_strip
    :parameters (?s - strip ?b - board ?bk - book)
    :precondition (soaked ?s)
    :effect (and 
        (rolled ?s) 
        (has ?b) 
        (has ?bk)
    )
)

;; ... More actions
)
```

Please note that this is a simplified domain definition and it doesn't cover all actions described in the process of making papyrus for the sake of brevity.