
# Loop Functions and Debugging

Functions that allow you to execute loop-like behavior in a compact form. Typically, they have the word "apply" in them.

- `lapply()`: Loop over a list and evaluate a function on each element
- `sapply()`: Same as `lapply()` but try to simplify the result
- `apply()`: Apply a function over the margins of an array
- `tapply()`: Apply a function over subsets of a vector
- `mapply()`: Multivariate version of `lapply()`

An auxiliary function `split()` is also useful, particularly in conjunction with lapply.

## `lapply()`

`lapply()` takes three arguments: 
1. a list X; 
2. a function `FUN`; 
3. other arguments via its ... argument. 

If X is not a list, it will be coerced to a list using `as.list`. It always returns a list, regardless of the class of the input.

```r
x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

## Results
$a
[1] 3
$b
[1] 0.4671
4
```
Can be used with *anonymous* functions.

```r
> x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
> x
$a
     [,1] [,2]
[1,]    1    3
[2,]    2    4

$b
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6

> lapply(x, function(elt) elt[,1])
$a
[1] 1 2

$b
[1] 1 2 3
```

## `sapply()`
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTQxMDEwODg0MSwyMDQwMzc3NDUxLC0xNz
Y4MTEwOTEzXX0=
-->