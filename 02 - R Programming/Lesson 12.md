
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
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTU1NDMwMTQ0NiwxMDMxNDI0ODA0LDg1MT
Y4ODQ1XX0=
-->