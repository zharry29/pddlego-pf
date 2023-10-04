Sure, here is a problem file for fill-inventory:

``` 
(define (problem fill-inventory)
(:domain war_survival)
(:objects 
John - person
base1 - base
item1 item2 item3 - item
inventory1 - inventory
)

(:init 
(in John base1)
(at item1 base1)
(at item2 base1)
)

(:goal
(and 
(has item1 John) 
(has item2 John)
)
)
```
