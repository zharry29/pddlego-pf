(define (domain survival-woods)
  (:requirements :strips)
  (:predicates
    (has-item ?item)
    (collected ?item)
    (water-source ?source)
    (dry-flat-area-between-trees ?area)
    (has-support-branch ?branch)
    (support-branch-in-tree ?branch ?tree)
    (formed-shelter-support-structure ?structure)
    (branch-in-tree ?branch ?tree)
    (propped-up-branches ?branches)
    (layer-of-insulation ?layer)
    (leafy-material ?material)
    (edible-wild-berry ?berry)
    (edible-wild-mushroom ?mushroom)
    (edible-wild-plant ?plant)
    (snare-built ?snare)
    (caught-small-game ?game)
    (has-tinder ?tinder)
    (has-kindling ?kindling)
    (has-fuel ?fuel)
    (fire-started)
    (fire-used-for-warmth)
    (fire-used-for-cooking)
    (fire-used-for-purifying-water)
    (lost-in-woods)
    (safe-location ?location)
    (rescue-signal-generated)
  )
  
  (:action find-water
    :parameters (?source)
    :precondition (and (water-source ?source) (not (collected ?source)))
    :effect (collected ?source)
  )
  
  (:action build-teepee
    :parameters (?area)
    :precondition (and (dry-flat-area-between-trees ?area) (has-support-branch ?branch))
    :effect (formed-shelter-support-structure ?structure)
  )
  
  (:action collect-fuel
    :parameters (?branches ?fuel)
    :precondition (and (propped-up-branches ?branches) (not (collected ?fuel)))
    :effect (collected ?fuel)
  )
  
  (:action find-tinder
    :parameters (?tinder)
    :precondition (not (collected ?tinder))
    :effect (collected ?tinder)
  )
  
  (:action gather-kindling
    :parameters (?kindling)
    :precondition (not (collected ?kindling))
    :effect (collected ?kindling)
  )
  
  (:action start-fire
    :precondition (and (has-tinder ?tinder) (has-kindling ?kindling) (has-fuel ?fuel))
    :effect