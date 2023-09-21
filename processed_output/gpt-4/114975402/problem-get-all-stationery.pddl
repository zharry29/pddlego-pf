(define (problem problem-4-get-all-stationery)
  (:domain detective)
  (:objects notebook1 fingerprintingKit1 evidenceKit1 walkieTalkies1 - object)
  (:init
  )
  
  (:goal (and
           (notebook notebook1)
           (fingerprintingKit fingerprintingKit1)
           (evidenceKit evidenceKit1)
           (walkieTalkies walkieTalkies1)))
  )