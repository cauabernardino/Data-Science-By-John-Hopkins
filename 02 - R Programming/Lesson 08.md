# R Input and Evaluation

The things that are typed at the R prompt are called **expressions**.

The `<-` symbol is the assingment operator.

```r
> x <- 1
> print(x) # Explicit printing
[1] 1
> x # Auto printing 
[1] 1
> msg <- "hello" 
```
You can explict or auto print an object. The `#` character indicates a comment. Anything in the right is ignored.

The `[1]` indicates that `x` is a vector and `5 ` is the first element.

```r
> x <- 1:20
> x
[1] 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
[16] 16 17 18 19 20
```
You can assign multiple values at a time using `:
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE1OTkzODA5NTldfQ==
-->