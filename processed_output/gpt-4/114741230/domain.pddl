(define (domain secret_society)
  (:requirements :strips :typing)
  (:types friend)
  (:predicates 
    (secret_created ?s)
    (members_added ?m)
    (society_created ?sc)
    (players_verified ?pv)
  )

  (:action create_secret
    :parameters (?s)
    :effect (and 
                (secret_created ?s)
            )
  )
  
  (:action add_members
    :parameters (?m ?s)
    :precondition (secret_created ?s)
    :effect (and 
                (members_added ?m)
            )
  )

  (:action start_society
    :parameters (?sc ?m)
    :precondition (members_added ?m)
    :effect (and 
                (society_created ?sc)
            )
  )

  (:action verify_players
    :parameters (?pv ?sc)
    :precondition (society_created ?sc)
    :effect (and 
                (players_verified ?pv)
            )
  )
)