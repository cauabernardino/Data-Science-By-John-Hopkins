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

<a href="https://www.codecogs.com/eqnedit.php?latex=y&space;=&space;\beta_0&space;&plus;&space;\beta_1x&space;&plus;&space;\varepsilon" target="_blank"><img src="https://latex.codecogs.com/svg.latex?y&space;=&space;\beta_0&space;&plus;&space;\beta_1x&space;&plus;&space;\varepsilon" title="y = \beta_0 + \beta_1x + \varepsilon" /></a>


$$
where $\varepsilon \sim N(0, 2^2)$. Assume $x \sim N(0, 1^2)$, $\beta_0 = 0.5$ and  $\beta_1= 2$.

```r
> set.seed(20)
> x <- rnorm(100)
> e <- rnorm(100, 0, 2)
> y <- 0.5 + 2 * x + e
> summary(y)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-6.4084 -1.5402  0.6789  0.6893  2.9303  6.5052 
> plot(x, y)
```

## Random sampling

The `sample()` function returns random numbers from a set of scalar objects.
```r
> set.seed(1)
> sample(1:10, 4)
[1] 3 4 5 7
> sample(1:10, 4)
[1] 3 9 8 5
> sample(letters, 5)
[1] "q" "b" "e" "x" "p"
> sample(1:10) ## permutation
[1] 4 710 6 9 2 8 3 1 5
> sample(1:10)
[1] 2 3 4 1 9 5 10 8 6 7
> sample(1:10, replace = TRUE) ## Sample w/replacement
[1] 2 9 7 8 2 8 5 9 7 8
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE0MTY3MDUyOTMsMTY2OTgyMDU1MiwxMz
I0NzA1NDk5LC05NDc5NzMzNjNdfQ==
-->