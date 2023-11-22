(define (problem kitchen-problem)
    (:domain kitchen-adventure)
    
    (:objects
        kitchen pantry - room
        fridge kitchen-cupboard cutlery-drawer trash-can dishwasher - container
        east west - direction
        stove knife - tool
        onion flour - ingredient
    )
    
    (:init
        (at kitchen)
        (container-closed fridge) (container-closed kitchen-cupboard)
        (container-closed cutlery-drawer) (container-closed trash-can)
        (container-closed dishwasher)
        
        (contains fridge onion) (contains pantry flour)
        
        (connected kitchen pantry west)
        (door-closed kitchen pantry)
        
        (has-tool knife) (has-tool stove)
        
        (not (recipe-completed))
        (not (meal-prepared))
    )
    
    (:goal (and (recipe-completed) (meal-prepared)))
)