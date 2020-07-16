# Random Numbers (Simulation)

Functions for probability distributions in R:
- `rnorm()`: generate random Normal variates with a given mean and standard deviation
- `dnorm()`: evaluate the Normal probability density (with a given mean/SD) at a point (or vector of
points)
- `pnorm()`: evaluate the cumulative distribution function for a Normal distribution
- `rpois()`: generate random Poisson variates with a given rate

Setting the random number seed with `set.seed()` ensures reproducibility.


## Generating Random Numbers from a Linear Model

If we have the following linear model:
$$
y = \beta_0 + \beta_1x + \varepsilon
$$
where $\varepsilon \sim N$
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTg3MjI5NDY1NCwtOTQ3OTczMzYzXX0=
-->