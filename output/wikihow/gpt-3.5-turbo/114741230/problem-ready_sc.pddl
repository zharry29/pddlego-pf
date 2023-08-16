;; Problem file - Ady Sc

(define (problem ady-sc)
  (:domain SecretSociety)
  (:objects 
    cult_1 - cult
    player_1 - player
    player_2 - player
    player_3 - player
    location_1 - location
    room_1 - room
  )
  (:init
    (cult_exists cult_1)
    (player_exists player_1)
    (player_exists player_2)
    (player_exists player_3)
    (has_friendship player_1 player_2)
    (has_friendship player_1 player_3)
    (meeting_place location_1)
  )
  (:goal 
    (and
      (cult_exists cult_1)
      (has_friendship player_1 player_2)
      (has_friendship player_1 player_3)
    )
  )
)

This problem file represents the addition of two additional players (player_2 and player_3) to an existing secret society (cult_1). Please let me know if you need any other problem files as well.