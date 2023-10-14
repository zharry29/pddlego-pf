(define (domain detective)
(:requirements :strips :typing)
(:types object)
(:predicates
    (bag ?x)
    (hasPockets ?x)
    (backupBag ?x)
    (gear ?x)
    (alias ?a)
    (disguise ?d)
    (costume ?c)
    (headgear ?h)
    (accessory ?a)
    (badge ?b)
    (notebook ?n)
    (fingerprintingKit ?f)
    (evidenceKit ?e)
    (walkieTalkies ?w)
    (partner ?p)
)

(:action assemble-disguises
    :parameters 
    (:alias ?a - object)
    :effect (and 
               (disguise ?a)))

(:action assemble-detectiveKit
    :parameters ()
    :effect (and 
                (gear ?g)))

(:action buy-bag
    :parameters ()
    :effect (and  
                (bag ?b)))

(:action get-all-stationery
    :parameters ()
    :effect (and 
               (notebook ?n)
               (fingerprintingKit ?f)
               (evidenceKit ?e)
               (walkieTalkies ?w))))