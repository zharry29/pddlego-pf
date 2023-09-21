(define (problem get-coconut-meat-with-oven)
    (:domain coconut-operations)
    (:objects eye-1 eye-2 eye-3 coconut - object)

    (:init
        (coconut eye-1)
        (coconut eye-2)
        (coconut eye-3)
        (not (hole-in-eye eye-1))
        (not (hole-in-eye eye-2))
        (not (hole-in-eye eye-3))
        (not (coconut-meat coconut))
        (oven-used coconut)
    )

    (:goal (coconut-meat coconut))
)