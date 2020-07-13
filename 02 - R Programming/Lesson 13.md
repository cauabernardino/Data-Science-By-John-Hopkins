
# Mapping Functions and Debugging

Functions that allow you to execute loop-like behavior in a compact form. Typically, they have the word "apply" in them. Their behaviour is similar to `map()` function in Python.

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

`sapply()` will try to simplify the result of lapply if possible.
- If the result is a list where every element is length 1, then a vector is returned
- If the result is a list where every element is a vector of the same length (> 1), a matrix is returned.
- If it can’t figure things out, a list is returned

```r
> x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
> sapply(x, mean)
         a          b          c          d 
 2.5000000 -0.2592703  0.5095762  4.9793924 
```

## `apply()`

`apply()` is used to a evaluate a function over the margins of an array.
- It is most often used to apply a function to the rows or columns of a matrix
- It can be used with general arrays, e.g. taking the average of an array of matrices
- It is not really faster than writing a loop, but it works in one line!
```r
> x <- matrix(rnorm(200), 20, 10)
> apply(x, 2, mean) # For the column means
> apply(x, 1, sum) # For the row means
```

### col/row sums and means
For sums and means of matrix dimensions, we have some shortcuts.

- `rowSums()` = `apply(x, 1, sum)`
- `rowMeans()` = `apply(x, 1, mean)`
- `colSums()` = `apply(x, 2, sum)`
- `colMeans()` = `apply(x, 2, mean)`

## `mapply()`

A multivariate apply of sorts which applies a function in parallel over a set of arguments.
```r
>list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
## This is the same as the above
> mapply(rep, 1:4, 4:1)
> 
## Results
[[1]]
[1] 1 1 1 1
[[2]]
[1] 2 2 2
[[3]]
[1] 3 3
[[4]]
[1] 4
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTM4ODM0OTE3MCwtMjAxMDQxMjQ1MiwyMD
QwMzc3NDUxLC0xNzY4MTEwOTEzXX0=
-->