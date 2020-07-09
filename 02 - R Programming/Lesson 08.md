# R Inputs and Data types

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
You can assign multiple values at a time using `:` to create integer sequences.

## Objects

The basic (or "atomic") classes of objects are:
- Character (string);
- Numeric (real numbers);
- Integer;
- Complex;
- Logical (True/False).

The most basic object is a vector.
- Vector can only contain objects of the same class;
- The exception are the *lists*, which are represented by a vector but can contain object of different classes.

Empty vectors can be created with  the `vector()` function.

## Numbers
- Numbers in R a generally treated as numeric objects (i.e. double precision real numbers)
- If you explicitly want an integer, you need to specify the `L` suffix
	+ Ex: Entering `1` gives you a numeric object; entering `1L` explicitly gives you an integer.
- There is also a special number `Inf` which represents infinity; `Inf` can be used in ordinary calculations; e.g. `1 / Inf` is `0`
- The value `NaN` represents an undefined value (“not a number”); e.g. `0 / 0`; `NaN`can also represent a missing value

## Attributes

The R objects can have the following attributes:
- class
- length
- names, dimnames
- dimensions (matrices, arrays)

Attributes of an object can be accessed using the `attributes()` function.

## Vectors and Lists

The `c()` function can be used to create vector of objects, as follows.
```r
> x <- c(0.4, 0.7) ## numeric
> x <- c(TRUE, FALSE) ## logical
> x <- c(T, F) ## logical
> x <- c("a", "b", "c") ## character
> x <- 9:19 ## integer
> x <- c(2+0i, 1+3i) ## complex
```
Also, it can be used `vector()`.

```r
> x <- vector("numeric", length = 10)
> x
[1] 0 0 0 0 0 0 0 0 0 0
```

When different objects are mixed in a vector, *coercion* occurs so that every element in the vector is of the same class.
```r
> y <- c(4.3, "a") ## character
> y <- c(TRUE, 9) ## numeric
> y <- c("d", TRUE) ## character
```

Objects can be explicitly coerced from one class to another using the `as.*` functions, if available
```r
> x <- 0:5
> class(x)
[1] "integer"
> as.numeric(x)
[1] 0 1 2 3 4 5
> as.logical(x)
[1] FALSE TRUE TRUE TRUE TRUE TRUE
> as.character(x)
[1] "0" "1" "2" "3" "4" "5"
```
Nonsensical coercion will results in `NAs` messages.

Lists are a special type of vector that can contain elements of *different* classes, and can be implemented with the `list()` as follows:
```r
> x <- list(3, "a", 4, "b", TRUE, 1 + 2i, 5, "c")
> x
[[1]]
[1] 3
[[2]]
[1] "a"
[[3]]
[1] 4
[[4]]
[1] "b"
[[5]]
[1] TRUE
[[6]]
[1] 1+2i
[[7]]
[1] 5
[[8]]
[1] "c"
```

## Matrices

Matrices can be understood as a vector with a *dimension* attribute. The *dimension* attribute is itself an integer vector of length 2 (nrow, ncol). It is used the `matrix()` function.
```r
> m <- matrix(nrow = 2, ncol = 3)
> m
     [,1] [,2] [,3]
[1,]   NA   NA   NA
[2,]   NA   NA   NA
> dim(m)
[1] 2 3
> attributes(m)
$dim
[1] 2 3
```
Matrices are constructed *column-wise*, so entries can be thought of starting in the “upper left” corner and running down the columns.
```r
> m <- matrix(1:6, nrow = 2, ncol = 3)
> m
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
```
Matrices can also be created directly from vectors by adding a dimension attribute.

```r
> m <- 1:10
> m
[1] 1 2 3 4 5 6 7 8 9 10
> dim(m) <- c(2, 5)
> m
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    3    5    7    9
[2,]    2    4    6    8   10
```
Matrices can also be created by *column-binding* or *row-binding* with `cbind()` and `rbind()`.

```r
> x <- 1:3
> y <- 10:12
> cbind(x, y)
x y
     x  y
[1,] 1 10
[2,] 2 11
[3,] 3 12
> rbind(x, y)
  [,1] [,2] [,3]
x    1    2    3
y   10   11   12
```

## Factors

Factors are used to represent categorical data. Factors can be unordered or ordered. One can think of a factor as an integer vector where each integer has a *label*. Can be created with the `factor()` function.

- Factors are treated specially by modelling functions like `lm()` and `glm()`;
- Using factors with labels is better than using integers because factors are self-describing; having a variable that has values “Male” and “Female” is better than a variable that has values 1 and 2.
```r
> x <- factor(c("yes", "yes", "no", "yes", "no"))
> x
[1] yes yes no yes no
Levels: no yes
> table(x) # show x in a table format
x
no yes
 2   3 
> unclass(x) # show x attributes in integer format
[1] 2 2 1 2 1
attr(,"levels")
[1] "no" "yes"
```

The order of the levels can be set using the `levels` argument to `factor()`. This can be important in linear modelling because the first level is used as the baseline level.
```r
> x <- factor(c("yes", "yes", "no", "yes", "no"),
				levels = c("yes", "no"))
> x
[1] yes yes no yes no
Levels: yes no
```


## Missing values

Missing values are denoted by `NA` or `NaN` for undefined mathematical operations.

- `is.na()` is used to test objects if they are `NA`;
- `is.nan()` is used to test for `NaN`;
- `NA` values have a class also, so there are integer `NA`, character `NA`, etc;
- A `NaN` value is also `NA` but the converse is not true.
```r
> x <- c(1, 2, NA, 10, 3)
> is.na(x)
[1] FALSE FALSE TRUE FALSE FALSE
> is.nan(x)
[1] FALSE FALSE FALSE FALSE FALSE
> x <- c(1, 2, NaN, NA, 4)
> is.na(x)
[1] FALSE FALSE TRUE TRUE FALSE
> is.nan(x)
[1] FALSE FALSE TRUE FALSE FALSE
```
## Data Frames


Data frames are used to store tabular data. Can be created by using `data.frame()`.
- They are represented as a special type of list where every element of the list has to have the same length;
- Each element of the list can be thought of as a column and the length of each element of the list is the number of rows;
- Unlike matrices, data frames can store different classes of objects in each column (just like lists), matrices must have every element be the same class;
- Data frames also have a special attribute called `row.names`;
- Data frames are also created by calling `read.table()` or `read.csv()`;
- Can be converted to a matrix by calling `data.matrix()`.

```r
> x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
> x
  foo   bar
1   1  TRUE
2   2  TRUE
3   3 FALSE
4   4 FALSE
> nrow(x)
[1] 4
> ncol(x)
[1] 2
```

## Names

R objects can have names, which is very useful for writing readable code and self-describing objects. It is used the `names()` function.

```r
> x <- 1:3
> names(x)
NULL
> names(x) <- c("foo", "bar", "norf")
> x
 foo  bar norf 
   1    2    3 
> names(x)
[1] "foo" "bar" "norf"
```
Lists can also have names. They can be applied by using a key-value pair, as follows.

```r
> x <- list(a = 1, b = 2, c = 3)
> x
$a
[1] 1
$b
[1] 2
$c
[1] 3
```

For matrices, it is used `dimnames()` for naming de columns and rows.
```r
> m <- matrix(1:4, nrow = 2, ncol = 2)
> dimnames(m) <- list(c("x1", "x2"), c("y1", "y2"))
> m
c d
   y1 y2
x1  1  3
x2  2  4
```

## Dates and Times in R

- Dates are represented by the `Date` class
- Times are represented by the `POSIXct` or the `POSIXlt` class
- Dates are stored internally as the number of days since 1970-01-01
- Tmes are stored internally as the number of seconds since 1970-01-01

They can be coerced from a character string using the
`as.Date()` function.

```r
x <- as.Date("1970-01-01")
x
[1] "1970-01-01"
# To look it without the data format, use unclass
unclass(x)
[1] 0
# Therefore, the day after is 1 and so on
unclass(as.Date("1970-01-02"))
[1] 1
```

`POSIXct` is just a very large integer under the hood; it use a useful class when you want to store times in something like a data frame.

`POSIXlt` is a list underneath and it stores a bunch of other useful information like the day of the week, day of the year, month, day of the month.

There are a number of generic functions that work on dates and times
- `weekdays()`: give the day of the week
- `months()`: give the month name
- `quarters()`: give the quarter number (“Q1”, “Q2”, “Q3”, or “Q4”)

Times can be coerced from a character string using the `as.POSIXlt()` or a`s.POSIXct()` function.

```r
x <- Sys.time()
x
[1] "2013-01-24 22:04:14 EST"
p <- as.POSIXlt(x)
names(unclass(p))
[1] "sec" "min" "hour" "mday" "mon"
[6] "year" "wday" "yday" "isdst"
p$sec
## [1] 14.34
```
It can be done mathematical operations and comparisons on dates and times. 

```r
x <- as.Date("2012-03-01") y <- as.Date("2012-02-28")
x-y
## Time difference of 2 days
x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y-x
## Time difference of 1 hours
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTUxNzU1NjI0OSwtMTk0MDY2NzA3NCwxMD
U5ODA5MjAsLTE1MDIzMjcyOCw0ODkxNzg2MjgsLTEzMjQ0OTg4
NDksMTYwMzk1NTAyOCwxMTk1ODI3MjcyLDU0NDM3OTAzNF19
-->