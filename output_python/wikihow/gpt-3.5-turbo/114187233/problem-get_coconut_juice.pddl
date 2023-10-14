Here is the problem file for the task "get coconut juice":

```lisp
(define (problem get-coconut-juice)
    (:domain coconut-operations)
    (:objects eye-1 eye-2 eye-3 coconut-glass - object)

    (:init
        (coconut eye-1)
        (coconut eye-2)
        (coconut eye-3)
        (not (hole-in-eye eye-1))
        (not (hole-in-eye eye-2))
        (not (hole-in-eye eye-3))
        (not (coconut-juice coconut-glass))
    )

    (:goal (coconut-juice coconut-glass))
)
```
