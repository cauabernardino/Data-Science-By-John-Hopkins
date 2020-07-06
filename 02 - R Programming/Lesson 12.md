
# R Control Structures and Functions

Control structures allow us to control the flow of execution of the program. Commom structures are:

- `if, else`: testing a condition
- `for`: execute a loop in a fixed number of times
- `while`: execute a loop while a condition is true
- `repeat`: execute an infinite loop
- `break`: break the execution of a loop
- `next`: skip an interation of a loop
- `return`: exit a function


## If, else

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

# Different structure for 
y <- if(x > 3) {
	10
} else {
	0
}
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE5NTExNTUxNjgsODUxNjg4NDVdfQ==
-->