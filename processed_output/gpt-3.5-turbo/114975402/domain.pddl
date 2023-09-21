(define (domain detective-kit)
  (:requirements :strips :typing)
  (:types bag person disguise item alias evidence tool)
  (:predicates 
    (has_bag ?p - person ?b - bag)
    (has_pockets ?b - bag)
    (has_compartments ?b - bag)
    (has_alias ?p - person ?a - alias)
    (has_disguise ?p - person ?d - disguise)
    (has_part ?d - disguise ?i - item)
    (has_costume ?a - alias ?i - item)
    (has_accessory ?d - disguise ?i - item)
    (has_fingerprinting_kit ?p - person)
    (has_dust ?p - person)
    (has_brush ?p - person)
    (has_clear_tape ?p - person)
    (has_evidence_kit ?p - person)
    (has_baggies ?p - person)
    (has_gloves ?p - person)
    (has_tape_measure ?p - person)
    (has_tweezers ?p - person)
    (has_magnifying_glass ?p - person)
    (has_chalk ?p - person)
    (has_flashlight ?p - person)
    (has_partner ?p - person ?partner - person)
    (has_walkie_talkies ?p - person)
    (has_item ?b - bag ?i - item))

  (:action buy-bag
    :parameters (?p - person ?b - bag)
    :precondition (and (not (has_bag ?p ?b)))
    :effect (and (has_bag ?p ?b) (has_pockets ?b) (has_compartments ?b)))

  (:action choose-alias
    :parameters (?p - person ?a - alias)
    :precondition (and (not (has_alias ?p ?a)))
    :effect (has_alias ?p ?a))

  (:action choose-disguise
    :parameters (?p - person ?d - disguise)
    :precondition (and (not (has_disguise ?p ?d)))
    :effect (has_disguise ?p ?d))

  (:action choose-part
    :parameters (?d - disguise ?i - item)
    :precondition (and (not (has_part ?d ?i)))
    :effect (has_part ?d ?i))

  (:action choose-costume
    :parameters (?a - alias ?i - item)
    :precondition (and (not (has_costume ?a ?i)))
    :effect (has_costume ?a ?i))

  (:action choose-accessory
    :parameters (?d - disguise ?i - item)
    :precondition (and (not (has_accessory ?d ?i)))
    :effect (has_accessory ?d ?i))

  (:action assemble-disguises
    :parameters (?p - person)
    :precondition (and 
                    (has_alias ?p ?a1)
                    (has_alias ?p ?a2)
                    (has_alias ?p ?a3)
                    (distinct ?a1 ?a2 ?a3)
                    (has_costume ?a1 ?i1)
                    (has_costume ?a2 ?i2)
                    (has_costume ?a3 ?i3)
                    (distinct ?i1 ?i2 ?i3)
                    (has_accessory ?d1 ?i1)
                    (has_accessory ?d2 ?i2)
                    (has_accessory ?d3 ?i3)
                    (distinct ?d1 ?d2 ?d3))
    :effect (and 
              (not (has_alias ?p ?a1))
              (not (has_alias ?p ?a2))
              (not (has_alias ?p ?a3))
              (not (has_costume ?a1 ?i1))
              (not (has_costume ?a2 ?i2))
              (not (has_costume ?a3 ?i3))
              (not (has_accessory ?d1 ?i1))
              (not (has_accessory ?d2 ?i2))
              (not (has_accessory ?d3 ?i3))
              (has_part ?d1 ?i1)
              (has_part ?d2 ?i2)
              (has_part ?d3 ?i3)))

  (:action assemble-detective-kit
    :parameters (?p - person)
    :precondition (and 
                    (has_bag ?p ?b)
                    (has_item ?b ?nb)
                    (distinct ?b ?nb))
    :effect (and 
              (not (has_item ?b ?nb))
              (has_item ?b ?nb)))

  (:action get-all-stationery
    :parameters (?p - person ?nb - bag)
    :precondition (and 
                    (has_bag ?p ?nb)
                    (has_item ?nb ?stationery))
    :effect (and 
              (not (has_item ?nb ?stationery))
              (has_item ?nb ?stationery)))

  (:action get-bag-for-partner
    :parameters (?p - person ?partner - person ?b - bag)
    :precondition (and 
                    (has_partner ?p ?partner)
                    (has_bag ?partner ?nb)
                    (has_item ?nb ?b))
    :effect (and 
              (not (has_item ?nb ?b))
              (has_item ?nb ?b)))

  (:action set-up-fingerprinting-kit
    :parameters (?p - person)
    :precondition (and 
                    (has_fingerprinting_kit ?p)
                    (has_item ?fingerprinting_kit ?i1)
                    (has_brush ?p ?i2)
                    (has_dust ?p ?i3)
                    (has_clear_tape ?p ?i4)
                    (distinct ?i1 ?i2 ?i3 ?i4))
    :effect (and 
              (not (has_fingerprinting_kit ?p))
              (not (has_brush ?p ?i2))
              (not (has_dust ?p ?i3))
              (not (has_clear_tape ?p ?i4))
              (has_part ?fingerprinting_kit ?i1)
              (has_part ?fingerprinting_kit ?i2)
              (has_part ?fingerprinting_kit ?i3)
              (has_part ?fingerprinting_kit ?i4)))

  (:action set-up-evidence-collecting-kit
    :parameters (?p - person)
    :precondition (and 
                    (has_evidence_kit ?p)
                    (has_item ?evidence_kit ?i1)
                    (has_baggies ?p ?i2)
                    (has_gloves ?p ?i3)
                    (has_tape_measure ?p ?i4)
                    (has_tweezers ?p ?i5)
                    (has_magnifying_glass ?p ?i6)
                    (has_chalk ?p ?i7)
                    (has_flashlight ?p ?i8)
                    (distinct ?i1 ?i2 ?i3 ?i4 ?i5 ?i6 ?i7 ?i8))
    :effect (and 
              (not (has_evidence_kit ?p))
              (not (has_baggies ?p ?i2))
              (not (has_gloves ?p ?i3))
              (not (has_tape_measure ?p ?i4))
              (not (has_tweezers ?p ?i5))
              (not (has_magnifying_glass ?p ?i6))
              (not (has_chalk ?p ?i7))
              (not (has_flashlight ?p ?i8))
              (has_part ?evidence_kit ?i1)
              (has_part ?evidence_kit ?i2)
              (has_part ?evidence_kit ?i3)
              (has_part ?evidence_kit ?i4)
              (has_part ?evidence_kit ?i5)
              (has_part ?evidence_kit ?i6)
              (has_part ?evidence_kit ?i7)
              (has_part ?evidence_kit ?i8)))
)