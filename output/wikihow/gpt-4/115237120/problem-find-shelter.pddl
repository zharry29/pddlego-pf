Sure, here is a problem file for find-shelter:

``` 
(define (problem find-shelter) 
(:domain war_survival) 
(:objects 
Joe - person 
house1 - house 
base1 - base 
food1 - food
) 

(:init 
(in Joe base1) 
(at food1 base1) 
(has food1 Joe)
) 

(:goal (in Joe house1))
)
```