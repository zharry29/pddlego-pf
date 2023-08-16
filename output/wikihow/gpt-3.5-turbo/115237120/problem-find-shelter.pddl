(define (problem find-shelter)
  (:domain war-survival)
  (:objects
    alice - person
    warzone rural-area town1 town2 safe-zone - place
  )
  (:init
    (at alice warzone)
    (alive alice)
    (healthy alice)
    (has-id alice)
  )
  (:goal (and
    (safe safe-zone)
    (at alice safe-zone)
  ))
)