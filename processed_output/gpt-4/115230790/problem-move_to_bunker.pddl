(define (problem move_to_bunker)
(:domain comet-impact)
(:objects 
john - person
bunker1 - place
)
(:init
(at john location1)
(heard_prediction john)
)
(:goal
(and
(in_bunker john)
(moved john)
))
)