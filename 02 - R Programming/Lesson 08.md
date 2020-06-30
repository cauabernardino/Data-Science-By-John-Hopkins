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
- The expection are the *lists*, which are represented by a vector but can contain object of different classes.

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

##
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTkyNDM4NTU2NF19
-->