(define (problem ve-players)
  (:domain SecretSociety)
  (:objects 
    cult_1 - cult
    player_1 - player
    player_2 - player
    player_3 - player
    player_4 - player
    player_5 - player
    location_1 - location
    room_1 - room
  )
  (:init
    (cult_exists cult_1)
    (player_exists player_1)
    (player_exists player_2)
    (player_exists player_3)
    (player_exists player_4)
    (player_exists player_5)
    (has_friendship player_1 player_2)
    (has_friendship player_1 player_3)
    (has_friendship player_1 player_4)
    (has_friendship player_1 player_5)
    (meeting_place location_1)
  )
  (:goal 
    (and
      (cult_exists cult_1)
      (has_friendship player_1 player_2)
      (has_friendship player_1 player_3)
      (has_friendship player_1 player_4)
      (has_friendship player_1 player_5)
    )
  )
)

This problem file represents the addition of four additional players (player_2, player_3, player_4, and player_5) to an existing secret society (cult_1)