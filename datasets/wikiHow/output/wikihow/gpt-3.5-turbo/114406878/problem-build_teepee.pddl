(define (problem problem2-build-teepee)
  (:domain survival-woods)
  
  (:objects
    area1 area2 area3 - dry-flat-area-between-trees
    branch1 branch2 - has-support-branch
    structure1 structure2 - formed-shelter-support-structure
    tree1 tree2 - tree
  )
  
  (:init
    (dry-flat-area-between-trees area1)
    (dry-flat-area-between-trees area2)
    (dry-flat-area-between-trees area3)
    
    (has-support-branch branch1)
    (has-support-branch branch2)
    
    (tree tree1)
    (tree tree2)
  )
  
  (:goal
    (formed-shelter-support-structure structure1)
  )
)