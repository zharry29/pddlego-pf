(define (problem shelter_with_food)
(:domain survival)
(:objects 
john - person
rice - food)
(:init 
(has_food john rice)
(inforce_basement john))
(:goal (stay_sheltered_with_food john rice)))