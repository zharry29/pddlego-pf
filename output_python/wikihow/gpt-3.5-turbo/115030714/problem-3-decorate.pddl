(define (problem 3-decorate)
  (:domain anime-party)
  
  (:objects
    balloon1 balloon2 - anime-balloon
    frame1 frame2 - anime-photo-frame
  )
  
  (:init
    (anime-invitation invitation1)
    (anime-balloon balloon1)
    (anime-photo-frame frame1)
  )

  (:goal
    (and
      (anime-balloon balloon2)
      (anime-photo-frame frame2)
    )
  )
)