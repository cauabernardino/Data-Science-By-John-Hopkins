# Subsets

Most used operators used to extract subsets of R objects:
- `[]` always returns an object of the same class as the original; can be used to select more than one element (there is one exception);
- `[[]]` is used to extract elements of a list or a data frame; it can only be used to extract a single element and the class of the returned object will not necessarily be a list or data frame;
- `$` is used to extract elements of a list or data frame by name; semantics are similar to that of `[[]]`.

```r
> x <- c("a", "b", "c", "c", "d", "a")
> x[1]
[1] "a"
> x[2]
[1] "b"
> x[1:4]
[1] "a" "b" "c" "c"
> x[x > "a"]
[1] "b" "c" "c" "d"
> u <- x > "a"
> u
[1] FALSE TRUE TRUE TRUE TRUE FALSE
> x[u]
[1] "b" "c" "c" "d"
```

## Subsetting Lists
- Example 1
```r
> x <- list(foo = 1:4, bar = 0.6)
> x[1]
$foo
[1] 1 2 3 4
> x[[1]]
[1] 1 2 3 4
> x$bar
[1] 0.6
> x[["bar"]]
[1] 0.6
> x["bar"]
$bar
[1] 0.6
```
- Example 2
```r
> x <- list(foo = 1:4, bar = 0.6, baz = "hello")
> x[c(1, 3)]
$foo
[1] 1 2 3 4
$baz
[1] "hello"
```

The `[[]]` operator can be used with computed indices; `$` can only be used with literal names.

```r
> x <- list(foo = 1:4, bar = 0.6, baz = "hello")
> name <- "foo"
> x[[name]] ## computed index for ‘foo’
[1] 1 2 3 4
> x$name ## element ‘name’ doesn’t exist!
NULL
> x$foo
[1] 1 2 3 4 ## element ‘foo’ does exist
```

The `[[]]` can take an integer sequence.
```r
> x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
> x[[c(1, 3)]]
[1] 14
> x[[1]][[3]]
[1] 14
> x[[c(2, 1)]]
[1] 3.14
```
## Subsetting Matrices
Matrices can be subsetted in the usual way with *(i, j)* type indices.

```r
> x <- matrix(1:6, 2, 3)
> x[1, 2]
[1] 3
> x[2, 1]
[1] 2
```
You can live the indices in blank if you want to subset all row or column.
```r
> x[1, ]
[1] 1 3 5
> x[, 2]
[1] 3 4
```
By default, when a single element of a matrix or a row/column is retrieved, it is returned as a vector. This behavior can be turned off by setting `drop = FALSE`.
```r
# For a single element
> x <- matrix(1:6, 2, 3)
> x[1, 2]
[1] 3    # vector
> x[1, 2, drop = FALSE]
     [,1]
[1,]    3   # matrix

# For a row/column
> x[1, ]
[1] 1 3 5    # vector
> x[1, , drop = FALSE]
     [,1] [,2] [,3]
[1,]    1    3    5    # matrix
```

## Partial Matching

Partial matching of names is allowed with `[[]]` and `$`.

```r
> x <- list(aardvark = 1:5)
> x$a
[1] 1 2 3 4 5
> x[["a"]]
NULL
# For [[]] it is needed the exact = FALSE parameter
> x[["a", exact = FALSE]]  
[1] 1 2 3 4 5
```

## Removing NA values

A simple way to remove the NA values is:
```r
> x <- c(1, 2, NA, 4, NA, 5)
> bad <- is.na(x)
> x[!bad] # Use ! as the NOT operator
[1] 1 2 4 5
```
To create subsets without rows that contain NA values can be done by using `complete.cases()`, which return a logical vector indicating which cases have no missing values.

- Example 1 
```r
> x <- c(1, 2, NA, 4, NA, 5)
> y <- c("a", "b", NA, "d", NA, "f")
> good <- complete.cases(x, y)
> good
[1] TRUE TRUE FALSE TRUE FALSE TRUE
> x[good]
[1] 1 2 4 5
> y[good]
[1] "a" "b" "d" "f"
```
- Example 2
```r
> airquality[1:6, ]
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
3    12     149 12.6   74     5   3
4    18     313 11.5   62     5   4
5    NA      NA 14.3   56     5   5
6    28      NA 14.9   66     5   6
> good <- complete.cases(airquality)
> airquality[good, ][1:6, ]
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
3    12     149 12.6   74     5   3
4    18     313 11.5   62     5   4
7    23     299  8.6   65     5   7
8    19      99 13.8   59     5   8
```

## Vectorized operations

Many operations in R can be *vectorized*, making code more efficient, concise, and easier to read.
```r
> x <- 1:4; y <- 6:9
> x + y
[1] 7 9 11 13
> x > 2
[1] FALSE FALSE TRUE TRUE
> x >= 2
[1] FALSE TRUE TRUE TRUE
> y == 8
[1] FALSE FALSE TRUE FALSE
> x * y
[1] 6 14 24 36
> x / y
[1] 0.1666667 0.2857143 0.3750000 0.4444444
```

For matrices:
```r
> x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
> x * y ## element-wise multiplication
     [,1] [,2]
[1,]   10   30
[2,]   20   40
> x / y
     [,1] [,2]
[1,]  0.1  0.3
[2,]  0.2  0.4
> x %*% y ## true matrix multiplication
     [,1] [,2]
[1,]   40   40
[2,]   60   60
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTM0MTMxNDE2MCw2NDQwNTY1MV19
-->