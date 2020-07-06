
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

Functions are created using the function() directive and are stored as R objects just like anything
else. In particular, they are R objects of class “function”.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTIwMTk2NTg4NjIsLTIxMjE0MDA3NjgsMT
AzMTQyNDgwNCw4NTE2ODg0NV19
-->