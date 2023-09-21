(define (domain jungle-survival)
  (:requirements :strips :typing)
  
  ; Types
  (:types object location - object)
  
  ; Predicates
  (:predicates 
    (collected ?water - object)
    (bent ?leaf - object)
    (funnel ?leaf - object)
    (poured ?water - object)
    (bamboo-stalk ?bamboo - object)
    (flowed ?water - object)
    (bamboo-compartment ?compartment - object)
    (used-as-bottle ?compartment - object)
    (rock-formation ?formation - object)
    (natural-pool ?pool - object)
    (contaminated ?pool - object)
    (found ?container - object)
    (leaves ?leaves - object)
    (sheet ?sheet - object)
    (accumulated-condensation ?water - object)
    (distilled ?water - object)
    (contains ?container ?water - object)
    (edible ?food - object)
    (safe ?food - object)
    (looked-for ?fruit - object)
    (caught ?animal - object)
    (killed ?animal - object)
    (skinned ?animal - object)
    (cooked ?animal - object)
    (fished ?fish - object)
    (speared ?fish - object)
    (pinned ?fish - object)
    (made-trap ?trap - object)
    (crossed-river ?river - object)
    (safe-to-cross ?river - object)
    (wearing-repellent ?person - object)
    (covered ?person - object)
    (protected ?person - object)
    (watched-out ?animal - object)
    (carried ?weapon - object)
    (created-shelter ?shelter - object)
    (planted ?stick - object)
    (lined ?stick ?shelter - object)
    (supported ?shelter - object)
    (covered-with ?shelter ?covering - object)
    (built ?shelter - object)
    (rested ?person - object)
    (prepared ?person - object)
    (observed ?person - object)
    (planned ?person - object)
    (stuck ?person - object)
    (stay-at-crashsite ?person - object)
    (rescue-seeking ?person - object)
    (message-seen ?message - object)
    (orient ?person - object)
    (followed ?person - object)
    (moved ?person - object)
    (found ?point - object)
    (trail-found ?person - object)
    (found ?evidence - object)
    (followed ?signs - object))
  
  ; Actions
  (:action collect-rainwater-leaves
    :parameters (?leaf - object ?water - object)
    :precondition (and (bent ?leaf) (funnel ?leaf))
    :effect (and (collected ?water) (poured ?water)))

  (:action collect-rainwater-bamboo
    :parameters (?compartment - object ?water - object)
    :precondition (and (bamboo-stalk ?bamboo) (flowed ?water))
    :effect (and (bamboo-compartment ?compartment) (used-as-bottle ?compartment)))

  (:action collect-rainwater-rock-pool
    :parameters (?pool - object ?water - object)
    :precondition (and (rock-formation ?formation) (natural-pool ?pool) (not (contaminated ?pool)))
    :effect (and (collected ?water) (poured ?water)))

  (:action collect-rainwater-natural-container
    :parameters (?container - object ?water - object)
    :precondition (and (found ?container) (not (contains ?container ?water)))
    :effect (and (collected ?water) (poured ?water) (contains ?container ?water)))

  (:action make-solar-water-still
    :parameters (?container - object ?sheet - object ?water - object)
    :precondition (and (accumulated-condensation ?sheet) (not (distilled ?water)) (not (contains ?container ?water)))
    :effect (and (collected ?water) (distilled ?water) (contains ?container ?water)))

  (:action find-edible-food
    :parameters (?food - object)
    :precondition (and (edible ?food) (safe ?food))
    :effect (and (looked-for ?food)))

  (:action trap-animal
    :parameters (?animal - object ?trap - object)
    :precondition (and (made-trap ?trap) (caught ?animal))
    :effect (and (killed ?animal) (skinned ?animal) (cooked ?animal)))

  (:action fish-with-spear
    :parameters (?fish - object ?person - object)
    :precondition (and (fished ?fish) (speared ?fish) (pinned ?fish))
    :effect (and (caught ?fish) (killed ?fish) (skinned ?fish) (cooked ?fish)))

  (:action create-lean-to-shelter
    :parameters (?shelter - object ?stick - object ?person - object)
    :precondition (and (created-shelter ?shelter) (planted ?stick) (lined ?stick ?shelter) (supported ?shelter)
                      (not (covered-with ?shelter ?covering)))
    :effect (and (built ?shelter) (rested ?person)))

  (:action cover-shelter-leaves
    :parameters (?shelter - object ?covering - object ?person - object)
    :precondition (and (built ?shelter) (not (covered-with ?shelter ?covering)))
    :effect (and (covered-with ?shelter ?covering) (rested ?person)))

  (:action cross-river
    :parameters (?river - object ?person - object)
    :precondition (and (crossed-river ?river) (safe-to-cross ?river))
    :effect (and (moved ?person)))

  (:action protect-from-mosquitoes
    :parameters (?person - object)
    :precondition (and (wearing-repellent ?person) (covered ?person) (protected ?person))
    :effect (and (watched-out ?person) (rested ?person)))

  (:action protect-from-heat
    :parameters (?person - object)
    :precondition (and (covered ?person) (protected ?person))
    :effect (and (rested ?person)))

  (:action protect-from-predators
    :parameters (?person - object ?weapon - object)
    :precondition (and (watched-out ?person) (carried ?weapon))
    :effect (and (rested ?person)))

  (:action find-trail-back
    :parameters (?person - object ?point - object ?trail - object)
    :precondition (and (stuck ?person) (found ?point) (trail-found ?person))
    :effect (and (followed ?trail) (rested ?person)))

  (:action move-towards-civilization
    :parameters (?person - object ?point - object ?person - object ?streams - object)
    :precondition (and (moved ?person) (found ?point) (followed ?streams))
    :effect (and (rested ?person)))
)