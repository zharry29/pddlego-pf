(define (domain SecretSociety)
  (:requirements :strips :typing)
  
  ;; Types
  (:types cult player)
  
  ;; Predicates
  (:predicates
    (cult_exists ?c - cult)
    (player_exists ?p - player)
    (has_friendship ?p1 - player ?p2 - player)
    (secret_society_member ?p - player)
    (trusted_member ?p - player)
    (betrayed ?p - player)
    (meeting_place ?loc - location)
    (secret_chat ?p - player)
    (wearing_robes ?p - player)
    (has_access ?p - player ?r - room)
    (knows_secret ?p - player)
    (central_secret_revealed ?p - player)
  )
  
  ;; Actions
  (:action create_cult
    :parameters (?c - cult)
    :precondition (and)
    :effect (cult_exists ?c)
  )
  
  (:action add_players
    :parameters (?p1 - player ?p2 - player)
    :precondition (and (cult_exists ?c) (player_exists ?p1) (player_exists ?p2))
    :effect (has_friendship ?p1 ?p2)
  )
  
  (:action initiate_member
    :parameters (?p - player)
    :precondition (and (cult_exists ?c) (player_exists ?p) (has_friendship ?p ?friend) (not (betrayed ?p)) (not (secret_society_member ?p)))
    :effect (and (secret_society_member ?p) (trusted_member ?p) (wearing_robes ?p))
  )
  
  (:action schedule_meeting
    :parameters (?loc - location)
    :precondition (and (cult_exists ?c) (meeting_place ?loc))
    :effect (and (meeting_place ?loc) (not (meeting_place ?old-loc))))
  
  (:action chat_online
    :parameters (?p - player)
    :precondition (and (cult_exists ?c) (player_exists ?p) (has_friendship ?p ?friend))
    :effect (and (secret_chat ?p) (not (secret_chat ?old-p)))
  )
  
  (:action create_dress_code
    :parameters (?c - cult)
    :precondition (cult_exists ?c)
    :effect (and (wearing_robes ?p) (not (wearing_robes ?old-p))))
  
  (:action reveal_secret
    :parameters (?p - player)
    :precondition (and (cult_exists ?c) (player_exists ?p) (secret_society_member ?p))
    :effect (knows_secret ?p)
  )
  
  (:action reveal_central_secret
    :parameters (?p - player)
    :precondition (and (cult_exists ?c) (player_exists ?p) (secret_society_member ?p) (knows_secret ?p) (not (central_secret_revealed ?p)))
    :effect (central_secret_revealed ?p)
  )
  
  (:action expel_member
    :parameters (?p - player)
    :precondition (and (cult_exists ?c) (player_exists ?p) (secret_society_member ?p))
    :effect (and (betrayed ?p) (not (secret_society_member ?p)) (not (knows_secret ?p)) (not (central_secret_revealed ?p))))
)