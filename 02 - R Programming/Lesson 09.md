# Reading and Writing Data

Principal functions for reading data in R:
- `read.table()`, `read.csv()`, for reading tabular data;
- `readLines()`, for reading lines of a text file;
- `source()`, for reading in R code files ;(inverse of `dump()`);
- `dget()`, for reading in R code files (inverse of `dput()`);
- `load()`, for reading in saved workspaces;
- `unserialize()`, for reading single R objects in binary form.


Principal functions,  for writing data in R, analogously:
- `write.table()`
- `writeLines()`
- `dump()`
- `dput()`
- `save()`
- `serialize()`


## The `read.table()` function

The most important arguments are:
- `file`, the name of a file, or a connection;
- `header`, logical indicating if the file has a header line
- `sep`, a string indicating how the columns are separated
- `colClasses`, a character vector indicating the class of each column in the dataset
- `nrows`, the number of rows in the dataset
- `comment.char`, a character string indicating the comment character
- `skip`, the number of lines to skip from the beginning
- `stringsAsFactors`, should character variables be coded as factors?

For small to moderately sized datasets, you can usually call read.table without specifying any other arguments.

```r
data <- read.table("foo.txt")
```
R will automatically
- skip lines that begin with a #;
- figure out how many rows there are (and how much memory - needs to be allocated);
- figure what type of variable is in each column of the table Telling R all these things directly makes R run faster and more efficiently;
- `read.csv()` is identical to `read.table()` except that the default separator is a comma.


## Larger Datasets with `read.table()` function

With much larger datasets, doing the following things will make your life easier and will prevent R from choking:
- Read the help page for read.table, which contains many hints;
- Make a rough calculation of the memory required to store your dataset. If the dataset is larger than the amount of RAM on your computer, you can probably stop right here;
- Set `comment.char = ""` if there are no commented lines in your file.
- - Set `nrows`. This doesn’t make R run faster but it helps with memory usage. It can be use dthe Unix tool `wc` to calculate the number of lines in a file.
- Use the `colClasses` argument. Specifying this option make the function run MUCH faster. In order to use this option, you have to know the class of each column in your data frame. If all of the columns are “numeric”, for example, then you can just set `colClasses = "numeric"`. A quick way to figure out the classes of each column is:
```r
initial <- read.table("datatable.txt", nrows = 100)
classes <- sapply(initial, class)
tabAll <- read.table("datatable.txt",
colClasses = classes)
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTUwMzk5NTY1NSwyMTExNDE3MDYwLDE3Nz
k2MjYxNzEsMTgwNzkxODU1MV19
-->