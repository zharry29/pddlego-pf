(define (domain anime-party)
  (:requirements :strips :typing)
  (:types invitation anime-character dish drink balloon photo-frame)
  (:predicates 
    (anime-invitation ?invitation)
    (anime-character ?character)
    (anime-costume ?character)
    (anime-music ?playlist)
    (anime-on-tv ?anime)
    (party-favor ?item)
    (main-dish ?dish)
    (side-dish ?dish)
    (beverage ?drink)
    (decorated-sweet ?sweet)
    (anime-balloon ?balloon)
    (anime-photo-frame ?frame)
    (anime-place-card ?card)
    (anime-lantern ?lantern)
    (costume-contest-winner ?character)
    (game ?game)
    (craft ?craft)
  )

  (:action make-invitation
    :parameters (?invitation - invitation)
    :precondition ()
    :effect (anime-invitation ?invitation)
  )

  (:action make-costume
    :parameters (?character - anime-character)
    :precondition ()
    :effect (anime-costume ?character)
  )

  (:action prepare-music
    :parameters (?playlist - anime-music)
    :precondition ()
    :effect (anime-music ?playlist)
  )

  (:action play-anime-on-tv
    :parameters (?anime - anime-on-tv)
    :precondition ()
    :effect (anime-on-tv ?anime)
  )

  (:action make-party-favor
    :parameters (?item - party-favor)
    :precondition ()
    :effect (party-favor ?item)
  )

  (:action prepare-main-dish
    :parameters (?dish - main-dish)
    :precondition ()
    :effect (main-dish ?dish)
  )

  (:action serve-drink
    :parameters (?drink - drink)
    :precondition ()
    :effect (beverage ?drink)
  )

  (:action decorate-sweet
    :parameters (?sweet - decorated-sweet)
    :precondition ()
    :effect (decorated-sweet ?sweet)
  )

  (:action make-anime-balloon
    :parameters (?balloon - anime-balloon)
    :precondition ()
    :effect (anime-balloon ?balloon)
  )

  (:action put-anime-in-photo-frame
    :parameters (?frame - anime-photo-frame)
    :precondition ()
    :effect (anime-photo-frame ?frame)
  )

  (:action cut-out-anime-character
    :parameters (?card - anime-place-card)
    :precondition ()
    :effect (anime-place-card ?card)
  )

  (:action hang-paper-lantern
    :parameters (?lantern - anime-lantern)
    :precondition ()
    :effect (anime-lantern ?lantern)
  )

  (:action host-costume-contest
    :parameters (?character - anime-character)
    :precondition ()
    :effect (costume-contest-winner ?character)
  )

  (:action plan-game
    :parameters (?game - game)
    :precondition ()
    :effect (game ?game)
  )

  (:action do-craft
    :parameters (?craft - craft)
    :precondition ()
    :effect (craft ?craft)
  )
)
