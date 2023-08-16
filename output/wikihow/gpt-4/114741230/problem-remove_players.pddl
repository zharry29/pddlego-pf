Sure, here is the generated problem PDDL file for task: ve players.

```
(define (problem ve_players)
    (:domain secret_society)
    (:objects 
        player1 player2 player3 player4 player5 - friend
    )
    (:init
        (secret_created player1)
        (members_added player1)
        (society_created player1)
        (secret_created player2)
        (members_added player2)
        (society_created player2)
        (secret_created player3)
        (members_added player3)
        (society_created player3)
        (secret_created player4)
        (members_added player4)
        (society_created player4)
        (secret_created player5)
        (members_added player5)
        (society_created player5)
    )
    (:goal
        (and
            (players_verified player1)
            (players_verified player2)
            (players_verified player3)
            (players_verified player4)
            (players_verified player5)
        )
    )
)
```