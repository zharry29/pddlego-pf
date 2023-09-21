(define (problem jungle-survival-problem1)
  (:domain jungle-survival)
  (:objects
    bottle1 - container
    leaf1 leaf2 - leaf
    bamboo1 bamboo2 - bamboo
    rock-formation1 - location
    water1 - water
    stream1 - location
    filter1 - fabric
    fire1 - fire
    pot1 - container
    tin-can1 stainless-steel-bottle1 - metal_container
    still-container1 - container
    plastic-sheet1 - fabric
    rock1 rock2 - rock
    fruit1 fruit2 - fruit
    animal1 animal2 - animal
    knife1 knife2 - knife
    stick1 stick2 - stick
    shelter1 lean-to-shelter1 - shelter
    tree1 tree2 - tree
    crossing-river1 - location
    balance-tool1 - tool
    mosquito-repellent1 - tool
    mud1 - tool
    person1 - person
    weapon1 - tool
    animal-trap1 - animal_trap
    fish-spear1 - tool
    fishing-spot1 - location
    orientation-tool1 - tool
    village1 - location
    trail-start1 - location
    direction1 direction2 - stream_direction
  )
  (:init
    (rainfall_collection_method_available bottle1)
    (rainfall_collection_method_available leaf1)
    (rainfall_collection_method_available leaf2)
    (rainfall_collection_method_available bamboo1)
    (rainfall_collection_method_available bamboo2)
    (rock_formation rock-formation1)
    (stream stream1)
    (filter filter1)
    (fire fire1)
    (pot_for_boiling pot1)
    (metal_container tin-can1)
    (metal_container stainless-steel-bottle1)
    (container_for_still still-container1)
    (container_with_plastic_sheet still-container1 plastic-sheet1)
    (rock rock1)
    (rock rock2)
    (fruit fruit1)
    (fruit fruit2)
    (safe_to_eat fruit1)
    (safe_to_eat fruit2)
    (safe_to_eat_bamboo)
    (water_bottle bottle1)
    (filter filter1)
    (stream water1)
    (stream stream1)
    (pot_for_boiling pot1)
    (metal_container tin-can1)
    (fire fire1)
    (metal_container stainless-steel-bottle1)
    (freshwater_source water1)
    (container_for_still still-container1)
    (container_with_plastic_sheet still-container1 plastic-sheet1)
    (rock rock1)
    (rock rock2)
    (freshwater_source water1)
    (animal animal1)
    (animal animal2)
    (fruit fruit1)
    (fruit fruit2)
    (shelter_covered shelter1)
    (tree tree1)
    (tree tree2)
    (tree tree1)
    (tree tree2)
    (crossing_river crossing-river1)
    (balance_tool balance-tool1)
    (mosquito_repellent mosquito-repellent1)
    (mud mud1)
    (head_and_neck_protected person1)
    (predators_detected animal1)
    (predators_detected animal2)
    (weapon person1)
    (lost_on_foot crossing-river1)
    (trail_start trail-start1)
    (village village1)
    (stream stream1)
    (stream_direction direction1)
    (stream_direction direction2)
    (crossing_river crossing-river1)
    (balance_tool balance-tool1)
    (mosquito_repellent mosquito-repellent1)
    (mud mud1)
    (head_and_neck_protected person1)
    (predators_detected animal1)
    (predators_detected animal2)
    (weapon person1)
    (orientation_tool orientation-tool1)
    (animal_trap animal-trap1)
    (fish_spear fish-spear1)
    (fishing_spot fishing-spot1)
    (lean_to_shelter shelter1)
    (tree tree1)
    (tree tree2)
    (person person1)
    (lost_on_foot trail-start1)
    (stream stream1)
    (stream_direction direction1)
    (stream_direction direction2)
  )
  (:goal (and
    (collected_rainfall bottle1)
    (collected_rainfall bamboo1)
    (collected_rainfall bamboo2)
    (filtered_water water1 filter1)
    (boiled_water water1)
    (condensation_collected water1 still-container1)
    (safe_to_eat fruit1)
    (safe_to_eat fruit2)
    (animal_caught animal1)
    (animal_caught animal2)
    (skinned_animal animal1 knife1)
    (skinned_animal animal2 knife1)
    (animal_caught animal1)
    (not (animal_caught animal2)))
    (animal_caught animal2)
    (not (fish_spear fish-spear1))
    (animal_caught fish1)
    (animal_caught fish2)
    (shelter_covered shelter1)
    (balanced_river_crossing crossing-river1 balance-tool1)
    (mosquito_bites_protected person1 mosquito-repellent1)
    (mosquito_bites_protected person1 mud1)
    (head_and_neck_protected person1 fabric1)
    (predator_encounter animal1 person1)
    (predator_encounter animal2 person1)
    (follow_trail)
    (orientation trail-start1 orientation-tool1)
    (not (orientation ?l ?t)))
  (:metric minimize (total-time))
)