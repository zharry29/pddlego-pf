(define (domain coconut_processing)
(:requirements :strips :typing :conditional-effects)

(:types
coconut - object 
tool - object
)

(:predicates
(have ?tool - tool)
(have ?coconut - coconut)
(in ?coconut - object)
(eyeBored ?coconut - coconut)
(drained ?coconut - coconut)
(wrapped ?coconut - coconut)
(hammered ?coconut - coconut)
(broken ?coconut - coconut)
(meatFree ?coconut - coconut)
(fibreFree ?meat)
(emptyGlass ?glass)
(filledGlass ?glass)
)

(:actions
(:action poke_eye
:parameters (?c - coconut ?t - tool)
:precondition (and (have ?t) (have ?c))
:effect (eyeBored ?c)
)

(:action drain_coconut
:parameters (?c - coconut)
:precondition (and (eyeBored ?c) (not (drained ?c)))
:effect (drained ?c)
)

(:action wrap_coconut
:parameters (?c - coconut)
:precondition (and (have ?c) (drained ?c))
:effect (wrapped ?c)
)

(:action hit_coconut
:parameters (?c - coconut)
:precondition (and (wrapped ?c))
:effect (and (broken ?c) 
(not (wrapped ?c)))
)

(:action free_meat
:parameters (?c - coconut)
:precondition (and (broken ?c))
:effect (meatFree ?c)
)

(:action remove_fibre
:parameters (?c - coconut)
:precondition (and (meatFree ?c))
:effect (fibreFree ?c)
)

(:action fill_Glass
:parameters (?c - coconut)
:precondition (and (not(emptyGlass ?glass))(not (filledGlass ?glass)))
:effect (filledGlass ?glass)
)))