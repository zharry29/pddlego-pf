;; Problem file - Create Cult

(define (problem create-cult)
  (:domain SecretSociety)
  (:objects 
    cult_1 - cult
    player_1 - player
    player_2 - player
    location_1 - location
    room_1 - room
  )
  (:init
    (cult_exists cult_1)
    (player_exists player_1)
    (player_exists player_2)
    (has_friendship player_1 player_2)
    (meeting_place location_1)
  )
  (:goal 
    (cult_exists cult_1)
  )
)

This problem file represents the creation of a secret society (cult) with one player already existing. Please let me know if you need the other problem files as well.