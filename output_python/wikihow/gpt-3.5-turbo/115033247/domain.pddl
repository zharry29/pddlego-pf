(define (domain papyrus)
  (:requirements :strips)
  (:predicates
    (plant ?x)
    (good-stalk ?x)
    (inner-part ?x)
    (healthy ?x)
    (green-outer ?x)
    (white-inner ?x)
    (strips-cut ?x)
    (flexible ?x)
    (flat ?x)
    (weaved ?x)
    (pressed ?x)
    (dried ?x)
    (polished ?x)
    (cut ?x)
    (surface-covered ?x)
    (glue-mixture ?x)
    (dipped ?x)
    (smooth ?x)
    (dried-paper ?x))
  
  (:action obtain-plant
    :parameters (?x)
    :precondition (and )
    :effect 
      (and )
  )
  
  (:action cut-stalks
    :parameters (?x ?y ?z)
    :precondition (and )
    :effect 
      (and )
  )
  
  (:action peel-outer-layer
    :parameters (?x ?y ?z)
    :precondition (and )
    :effect 
      (and )
  )

  (:action cut-strips
    :parameters (?x ?y ?z)
    :precondition (and )
    :effect 
      (and )
  )
  
  (:action soak-strips
    :parameters (?x ?y)
    :precondition (and )
    :effect 
      (and )
  )
  
  (:action lay-strips
    :parameters (?x)
    :precondition (and )
    :effect 
      (and )
  )
  
  (:action roll-strips
    :parameters (?x ?y)
    :precondition (and )
    :effect 
      (and )
  )
  
  (:action weave-strips
    :parameters (?x ?y)
    :precondition (and )
    :effect 
      (and )
  )
  
  (:action press-strips
    :parameters (?x ?y)
    :precondition (and )
    :effect 
      (and )
  )
  
  (:action replace-linen
    :parameters (?x ?y)
    :precondition (and )
    :effect 
      (and )
  )
  
  (:action flatten-sheet
    :parameters (?x)
    :precondition (and )
    :effect 
      (and )
  )
  
  (:action polish-papyrus
    :parameters (?x ?y)
    :precondition (and )
    :effect 
      (and )
  )
  
  (:action cut-paper
    :parameters (?x ?y ?z)
    :precondition (and )
    :effect 
      (and )
  )
  
  (:action cover-surface
    :parameters (?x ?y ?z)
    :precondition (and )
    :effect 
      (and )
  )
  
  (:action mix-glue
    :parameters (?x)
    :precondition (and )
    :effect 
      (and )
  )
  
  (:action tear-strips
    :parameters (?x ?y ?z)
    :precondition (and )
    :effect 
      (and )
  )
  
  (:action dip-strips
    :parameters (?x ?y)
    :precondition (and )
    :effect 
      (and )
  )
  
  (:action lay-strips2
    :parameters (?x ?y)
    :precondition (and )
    :effect 
      (and )
  )
  
  (:action smooth-paper
    :parameters (?x)
    :precondition (and )
    :effect 
      (and )
  )
  
  (:action dry-paper
    :parameters (?x)
    :precondition (and )
    :effect 
      (and )
  )
)