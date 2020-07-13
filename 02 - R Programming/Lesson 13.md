
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

If X is not a list, it will be coerced to a list using `as.list`.

```r

```
<!--stackedit_data:
eyJoaXN0b3J5IjpbOTk1ODM1MDg0LC0xNzY4MTEwOTEzXX0=
-->