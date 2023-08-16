(define (domain jungle-survival)
  (:requirements :strips :typing)
  (:types location container fruit shelter animal - object
          bamboo stick leaf fabric knife rock - tool
          water fire - element
          person - agent)
  
  ;; Predicates
  (:predicates 
    (rainfall_collection_method_available ?method - container)
    (leaf ?item - leaf)
    (bamboo_stalk ?item - bamboo)
    (rock_formation ?location - location)
    (rainwater_pool ?location - location)
    (fruit ?item - fruit)
    (safe_to_eat ?item - fruit)
    (safe_to_eat_bamboo)
    (water_bottle ?container - container)
    (filter ?item - fabric)
    (boiled_water ?water - water)
    (stream ?location - location)
    (pot_for_boiling ?container - container)
    (metal_container ?container - container)
    (freshwater_source ?location - location)
    (container_for_still ?container - container)
    (container_with_plastic_sheet ?container - container)
    (condensation_collected ?water - water)
    (safe_to_drink ?water - water)
    (water_source ?location - location)
    (animal_trap ?location - location)
    (animal_caught ?animal - animal)
    (skinning_tool ?tool - tool)
    (fish_spear ?tool - tool)
    (fishing_spot ?location - location)
    (lean_to_shelter ?shelter - shelter)
    (tree ?location - location)
    (rock ?location - location)
    (shelter_covered ?shelter - shelter)
    (crossing_river ?location - location)
    (balance_tool ?tool - tool)
    (mosquito_repellent ?tool - tool)
    (mud ?tool - tool)
    (mosquito_bites_protected ?person - person)
    (head_and_neck_protected ?person - person)
    (predators_detected ?animal - animal)
    (predator_encounter ?animal - animal)
    (weapon ?tool - tool)
    (rescue_task ?location - location)
    (message_created ?message - string)
    (lost_on_foot)
    (orientation_tool ?tool - tool)
    (stream_direction ?direction - direction)
    (village ?location - location)
    (trail_start ?location - location)
    (follow_trail)
    (follow_water_source)
    (civilization_found))
  
  ;; Actions
  
  ;; Collect rainfall from leaves and bamboo stalks
  (:action collect_rainfall_leaves
    :parameters (?method - container ?leaf - leaf)
    :precondition (and (rainfall_collection_method_available ?method)
                       (leaf ?leaf))
    :effect (and (not (rainfall_collection_method_available ?method))
                 (collected_rainfall ?method)))
  
  (:action collect_rainfall_bamboo
    :parameters (?method - container ?bamboo - bamboo)
    :precondition (and (rainfall_collection_method_available ?method)
                       (bamboo_stalk ?bamboo))
    :effect (and (not (rainfall_collection_method_available ?method))
                 (collected_rainfall ?method)))
  
  ;; Filter and boil water
  (:action filter_water
    :parameters (?water - water ?filter - fabric)
    :precondition (and (stream ?water)
                       (filter ?filter))
    :effect (filtered_water ?water ?filter))
  
  (:action boil_water
    :parameters (?water - water ?fire - fire ?container - container)
    :precondition (and (freshwater_source ?water)
                       (fire ?fire)
                       (pot_for_boiling ?container))
    :effect (and (boiled_water ?water)
                 (not (freshwater_source ?water))))
  
  ;; Create a solar water still
  (:action create_solar_still
    :parameters (?container - container ?sheet - fabric ?rock - rock ?water - water)
    :precondition (and (container_for_still ?container)
                       (container_with_plastic_sheet ?container ?sheet)
                       (rock ?rock)
                       (freshwater_source ?water))
    :effect (and (condensation_collected ?water ?container)
                 (not (freshwater_source ?water))))
  
  ;; Gather fruits and determine their edibility
  (:action gather_fruits
    :parameters (?fruit - fruit)
    :precondition (fruit ?fruit)
    :effect (gathered_fruit ?fruit))
  
  (:action determine_edibility
    :parameters (?fruit - fruit)
    :precondition (gathered_fruit ?fruit)
    :effect (and (safe_to_eat ?fruit)
                 (not (gathered_fruit ?fruit))))

  ;; Build a hole-in-the-ground animal trap
  (:action build_animal_trap
    :parameters (?trap - animal_trap)
    :precondition (animal_trap ?trap)
    :effect (animal_trap_built ?trap))
  
  (:action catch_animal
    :parameters (?animal - animal ?trap - animal_trap ?tool - tool)
    :precondition (and (animal_trap_built ?trap)
                       (animal_caught ?animal)
                       (skinning_tool ?tool))
    :effect (and (not (animal_caught ?animal))
                 (skinned_animal ?animal ?tool)))
  
  ;; Fish with a spear
  (:action fish_with_spear
    :parameters (?tool - fish_spear ?fish - animal ?spot - fishing_spot)
    :precondition (and (fish_spear ?tool)
                       (animal ?fish)
                       (fishing_spot ?spot))
    :effect (and (animal_caught ?fish)
                 (not (fish_spear ?tool))))
  
  ;; Build a lean-to shelter
  (:action build_lean_to_shelter
    :parameters (?shelter - shelter ?tree - tree)
    :precondition (and (lean_to_shelter ?shelter)
                       (tree ?tree))
    :effect (and (shelter_covered ?shelter)
                 (not (lean_to_shelter ?shelter))))
  
  ;; Cross a river
  (:action cross_river
    :parameters (?location - crossing_river ?tool - balance_tool)
    :precondition (and (crossing_river ?location)
                       (balance_tool ?tool))
    :effect (crossed_river ?location ?tool))
  
  ;; Protect from mosquito bites
  (:action protect_from_bites
    :parameters (?person - person ?tool - mosquito_repellent)
    :precondition (mosquito_repellent ?tool)
    :effect (mosquito_bites_protected ?person ?tool))
  
  (:action apply_mud
    :parameters (?person - person ?tool - mud)
    :precondition (mud ?tool)
    :effect (mosquito_bites_protected ?person ?tool))
  
  ;; Protect head and neck from heatstroke, sunburn, and dehydration
  (:action protect_head_and_neck
    :parameters (?person - person ?tool - fabric)
    :precondition (and (head_and_neck_protected ?person)
                       (fabric ?tool))
    :effect (head_and_neck_protected ?person ?tool))
  
  ;; Watch out for predators and carry a weapon
  (:action watch_for_predators
    :parameters (?animal - animal ?person - person)
    :precondition (and (predators_detected ?animal)
                       (weapon ?person))
    :effect (and (not (predators_detected ?animal))
                 (predator_encounter ?animal ?person)))
  
  ;; Determine orientation and get back on track if lost on foot
  (:action determine_orientation
    :parameters (?location - lost_on_foot ?tool - orientation_tool)
    :precondition (and (lost_on_foot ?location)
                       (orientation_tool ?tool))
    :effect (orientation ?location ?tool))
  
  (:action follow_trail
    :parameters (?start - trail_start ?tool - orientation_tool)
    :precondition (and (trail_start ?start)
                       (follow_trail)
                       (orientation ?start ?tool))
    :effect (and (follow_trail)
                 (not (trail_start ?start))
                 (follow_orientation ?tool)))
  
  (:action follow_water_source
    :parameters (?