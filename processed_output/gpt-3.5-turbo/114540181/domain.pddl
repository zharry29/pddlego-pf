(define (domain survival)
  (:requirements :strips)
  (:predicates 
    (rainfall_collected ?item)
    (bamboo_stalk_bent ?item)
    (water_bottle_filled ?item)
    (water_bottle_broken ?item)
    (rock_formations_found)
    (natural_containers_found)
    (water_boiled)
    (water_filtered)
    (water_distilled)
    (fruit_recognized ?item)
    (fruit_collected ?item)
    (animals_trapped ?item)
    (animals_killed ?item)
    (animals_cooked ?item)
    (water_crossed)
    (mosquito_repellent_worn)
    (clothes_covered)
    (mud_applied_on_skin)
    (head_neck_covered)
    (observed_surroundings)
    (planned_escape)
    (stayed_at_crash_site)
    (message_created))
  
  (:action collect_rainfall_from_leaves
    :parameters (?leaf - leaf ?bottle - bottle)
    :precondition (and 
                    (rainfall_collected ?leaf)
                    (not (water_bottle_filled ?bottle)))
    :effect (and 
              (water_bottle_filled ?bottle)
              (not (rainfall_collected ?leaf))))
  
  (:action collect_rainfall_from_bamboo
    :parameters (?stalk - bamboo_stalk ?container - container)
    :precondition (and 
                    (bamboo_stalk_bent ?stalk)
                    (not (water_bottle_filled ?container)))
    :effect (and 
              (water_bottle_filled ?container)
              (not (bamboo_stalk_bent ?stalk))))
  
  (:action break_bamboo_compartment
    :parameters (?stalk - bamboo_stalk ?bottle - bottle)
    :precondition (and 
                    (bamboo_stalk_bent ?stalk)
                    (not (water_bottle_filled ?bottle))
                    (not (water_bottle_broken ?bottle)))
    :effect (and 
              (water_bottle_filled ?bottle)
              (water_bottle_broken ?bottle)
              (not (bamboo_stalk_bent ?stalk))))
  
  (:action find_rock_formations
    :precondition (not (rock_formations_found))
    :effect (rock_formations_found))
  
  (:action find_natural_containers
    :precondition (not (natural_containers_found))
    :effect (natural_containers_found))
  
  (:action boil_water
    :parameters (?stream - stream ?container - container)
    :precondition (and 
                    (not (water_boiled))
                    (water_filtered)
                    (water_bottle_filled ?container))
    :effect (and 
              (water_boiled)
              (not (water_filtered))
              (not (water_bottle_filled ?container))))
  
  (:action filter_water
    :parameters (?stream - stream ?container - container ?fabric - fabric)
    :precondition (and 
                    (not (water_filtered))
                    (rainfall_collected ?stream)
                    (water_bottle_filled ?container))
    :effect (and 
              (water_filtered)
              (not (rainfall_collected ?stream))
              (not (water_bottle_filled ?container))))
  
  (:action distill_water
    :parameters (?container - container ?sheet - sheet)
    :precondition (and 
                    (not (water_distilled))
                    (water_bottle_filled ?container)
                    (water_bottle_broken ?container))
    :effect (and 
              (water_distilled)
              (not (water_bottle_filled ?container))
              (not (water_bottle_broken ?container))))
  
  (:action recognize_fruits
    :parameters (?fruit - fruit)
    :precondition (not (fruit_recognized ?fruit))
    :effect (fruit_recognized ?fruit))
  
  (:action collect_fruits
    :parameters (?fruit - fruit)
    :precondition (and 
                    (fruit_recognized ?fruit)
                    (not (fruit_collected ?fruit)))
    :effect (fruit_collected ?fruit))
  
  (:action trap_animals
    :parameters (?animal - animal)
    :precondition (and 
                    (not (animals_trapped ?animal))
                    (fruit_collected ?animal))
    :effect (animals_trapped ?animal))
  
  (:action kill_animals
    :parameters (?animal - animal)
    :precondition (and 
                    (animals_trapped ?animal)
                    (not (animals_killed ?animal)))
    :effect (animals_killed ?animal))
  
  (:action cook_animals
    :parameters (?animal - animal)
    :precondition (and 
                    (animals_killed ?animal)
                    (not (animals_cooked ?animal)))
    :effect (animals_cooked ?animal))
  
  (:action cross_water
    :parameters (?river - river)
    :precondition (not (water_crossed))
    :effect (water_crossed))
  
  (:action wear_mosquito_repellent
    :precondition (not (mosquito_repellent_worn))
    :effect (mosquito_repellent_worn))
  
  (:action cover_clothes
    :precondition (not (clothes_covered))
    :effect (clothes_covered))
  
  (:action apply_mud
    :precondition (not (mud_applied_on_skin))
    :effect (mud_applied_on_skin))
  
  (:action cover_head_neck
    :precondition (not (head_neck_covered))
    :effect (head_neck_covered))
  
  (:action observe_surroundings
    :precondition (not (observed_surroundings))
    :effect (observed_surroundings))
  
  (:action plan_escape
    :precondition (and 
                    (observed_surroundings)
                    (not (planned_escape)))
    :effect (planned_escape))
  
  (:action stay_at_crash_site
    :precondition (planned_escape)
    :effect (not (planned_escape))
    :effect (stayed_at_crash_site))
  
  (:action create_message
    :precondition (not (message_created))
    :effect (message_created))
)