(define (problem task)
  (:domain task)
  (:objects
    counter table user trash bowl initial - location
    apple orange kettle-chips multigrain-chips jalapeno-chips 
    rice-chips energy-bar sponge - other
    seven-up coke lime-soda grapefruit-soda pepsi tea redbull water - soda
  )
  (:init
    (at initial)
    (item-at seven-up counter)
    (item-at lime-soda table)
    (item-at grapefruit-soda bowl)
    (item-at apple initial)
    (item-at orange bowl)
    (caffeinated seven-up)
    (caffeinated coke)
    (caffeinated pepsi)
    (caffeinated tea)
    (caffeinated redbull)
  )
  (:goal
    (and 
        (not (caffeinated lime-soda))
        (not (caffeinated grapefruit-soda))
        (at user)
        (not (have apple))
        (not (have orange)))
  )
)
