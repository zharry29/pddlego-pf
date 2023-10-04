Sure. Here's an instance of the problem "get-all-stationery":

```  
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
```

This problem simplifies the task into obtaining four specific pieces of detective stationery: a notebook, a fingerprinting kit, an evidence kit, and a pair of walkie-talkies. The problem is solved when all these items have been gathered.