(define (problem jungle-survival-problem2)
  (:domain jungle-survival)
  (:objects 
    bottle1 - container
    filter1 - fabric
    water1 - water
    fire1 - fire
    pot1 - container
    tin-can1 stainless-steel-bottle1 - metal_container
    freshwater_source1 freshwater_source2 - location
  )
  (:init
    (rainfall_collection_method_available bottle1)
    (filter filter1)
    (stream water1)
    (pot_for_boiling pot1)
    (metal_container tin-can1)
    (fire fire1)
    (metal_container stainless-steel-bottle1)
    (freshwater_source freshwater_source1)
    (freshwater_source freshwater_source2)
  )
  (:goal (and
    (filtered_water water1 filter1)
    (boiled_water water1))
  )
  (:metric minimize (total-time))
)
