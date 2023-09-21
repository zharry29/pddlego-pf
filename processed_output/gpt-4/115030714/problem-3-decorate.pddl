(define (problem decorate)
 (:domain anime-party)
 (:objects
   planner - person
   balloons cake - decoration
 )
 (:init
   (not (decorated balloons))
   (not (decorated cake))
 )
 (:goal
   (and (decorated balloons) (decorated cake))
 )
)