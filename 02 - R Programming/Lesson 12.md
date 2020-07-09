
# R Control Structures and Functions

Control structures allow us to control the flow of execution of the program. Commom structures are:

- `if, else`: testing a condition
- `for`: execute a loop in a fixed number of times
- `while`: execute a loop while a condition is true
- `repeat`: execute an infinite loop
- `break`: break the execution of a loop
- `next`: skip an interation of a loop
- `return`: exit a function


## if, else

In a general way, the if-else has the following structure:
```r
# if-else
if(<condition>) {
	## do something
} else {
	## do something else
}

# if-else if-else
if(<condition1>) {
	## do something
} else if(<condition2>) {
	## do something different
} else {
	## do something different
}
```

Example:
```r
# One type of structure
if(x > 3) {
	y <- 10
} else {
	y <- 0
}

# Different structure for same problem
y <- if(x > 3) {
	10
} else {
	0
}
```

## for

`for` loops take an interator variable and assign it successive values from a sequence or vector. For loops are most commonly used for iterating over the elements of an object (list, vector, etc.)

```r
for(i in 1:10) {
	print(i)
}
```
The next loops have the same result with different structure:
```r
x <- c("a", "b", "c", "d")

for(i in 1:4) {
	print(x[i])
}
for(i in seq_along(x)) {
	print(x[i])
}
for(letter in x) {
	print(letter)
}
for(i in 1:4) print(x[i])
```

As other languages, `for` loops can be nested:

```r
x <- matrix(1:6, 2, 3)

for(i in seq_len(nrow(x))) {
	for(j in seq_len(ncol(x))) {
		print(x[i, j])
	}
}
```

## while

`while` loops are testing conditions, being executed until the condition is still true.

```r
count <- 0
while(count < 10) {
	print(count)
	count <- count + 1
}
```
  
Be careful with the testing conditions to avoid infinite loops.
It is also possible to have more than one conditions:

```r
z <- 5
while(z >= 3 && z <= 10) {
	print(z)
	coin <- rbinom(1, 1, 0.5)
	if(coin == 1) { ## random walk
		z <- z + 1
	} else {
		z <- z - 1
	}
}
```

## repeat

`repeat` initiates an infinite loop. It is useful when you need to repeat a condition until it reaches a condition (`break`) and you don't know exactly how much times it'll be needed. 

```r
x0 <- 1
tol <- 1e-8

repeat {
	x1 <- computeEstimate()
	if(abs(x1 - x0) < tol) {
		break
	} else {
		x0 <- x1
	}
}
```

Sometimes the condition may not be achieved, so it may be better to set a hard limit on the number of iterations using a `for` or `while` loop.


## next

`next` is used to skip an iteration of a loop.

```r
for(i in 1:100) {
	if(i <= 20) {
		## Skip the first 20 iterations
		next
	}
	## Do something here

}
```

## return

`return` signals that a function should exit and return a given value.

```r
for(i in 1:50) {
	if(i == 47) {
		## Exit function when condition is TRUE
		return
	}
	## Do something here
}
```

## Functions

Functions are created using the `function()` directive and are stored as R objects just like anything else. In particular, they are R objects of class “function”. They have the following structure:

```r
f <- function(<arguments>) {
	## Do something interesting
}
```

Functions in R are “first class objects”, which means that they can be treated much like any other R object. Importantly:

- Functions can be passed as arguments to other functions
- Functions can be nested, so that you can define a function inside of another function
- The return value of a function is the last expression in the function body to be evaluated.

### Function Arguments

Functions have *named arguments* which potentially have default values.
- The formal arguments are the arguments included in the function definition
- The formals function returns a list of all the formal arguments of a function
- Not every function call in R makes use of all the formal arguments
- Function arguments can be missing or might have default values

When an argument is matched by name, it
is “taken out” of the argument list and the remaining unnamed arguments are matched in the order
that they are listed in the function definition.
Example of equivalent calls:

```r
lm(data = mydata, y ~ x, model = FALSE, 1:100)
lm(y ~ x, mydata, 1:100, model = FALSE)
```
The `...` argument indicate a variable number of arguments that are usually passed on to other
functions. It is often used when extending another function and you don’t want to copy the entire argument list of the original function.

```r
myplot <- function(x, y, type = "l", ...) {
plot(x, y, type = type, ...)
}
```
The `...` argument is also necessary when the number of arguments passed to the function cannot be known in advance.

```r
> args(paste)
function (..., sep = " ", collapse = NULL)
> args(cat)
function (..., file = "", sep = " ", fill = FALSE, labels = NULL, append = FALSE)
```
One catch with `...` is that any arguments that appear after it on the argument list must be named
explicitly and cannot be partially matched.

### Environments
When R tries to bind a value to a symbol, it searches through a series of `environments` to find the appropriate value. When you are working on the command line and need to retrieve the value of an R object, the order is roughly

1. Search the global environment for a symbol name matching the one requested.
2. Search the namespaces of each of the packages on the search list

The search list can be found by using the `search()` function.

```r
> search()
 [1] ".GlobalEnv"        "tools:rstudio"    
 [3] "package:stats"     "package:graphics" 
 [5] "package:grDevices" "package:utils"    
 [7] "package:datasets"  "package:methods"  
 [9] "Autoloads"         "package:base"
```
Typically, a function is defined in the global environment, so that the values of free variables are just found in the user’s workspace. However, in R you can have functions defined inside other functions. In this case the environment in which a function is defined is the
body of another function.
Example:
```r
make.power <- function(n) {
	pow <- function(x) {
		x^n
	}
	pow
}
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE3ODE4ODU4MSwtMjg0ODMwMDc1LDE2ND
YzMTc3OTEsMTU1ODI5MDcyMSwtMTM3MDg2OTkxLC0xMzI3NzY4
MDQ3LC0yMTIxNDAwNzY4LDEwMzE0MjQ4MDQsODUxNjg4NDVdfQ
==
-->