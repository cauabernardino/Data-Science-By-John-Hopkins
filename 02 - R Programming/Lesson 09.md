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
## Calculating Memory Requirements

I have a data frame with 1,500,000 rows and 120 columns, all of which are numeric data. Roughly, how much memory is required to store this data frame?
```
1,500,000 × 120 × 8 bytes/numeric
= 1440000000 bytes
= 1440000000 / 2^20 bytes/MB
= 1,373.29 MB
= 1.34 GB
```

## Textual Data 

- dumping and dputing are useful because the resulting textual format is edit-able, and in the case of corruption, potentially recoverable;
- Unlike writing out a table or csv file, `dump()` and `dput()` preserve the *metadata* (sacrificing some readability), so that another user doesn’t have to specify it all over again;
- Textual formats can work much better with version control programs like subversion or git which can only track changes meaningfully in text files;
- Textual formats can be longer-lived; if there is corruption somewhere in the file, it can be easier to fix the problem
-  Textual formats adhere to the “Unix philosophy”;
- Downside: The format is not very space-efficient.

### dput-ting R Objects

A way to pass data around is by deparsing the R object with `dput()` and reading it back in using `dget()`.
```r
> y <- data.frame(a = 1, b = "a")
> dput(y)
structure(list(a = 1, b = "a"), class = "data.frame", row.names = c(NA, -1L))
> dput(y, file = "y.R")
> new.y <- dget("y.R")
> new.y
  a b
1 1 a
```

### Dumping R Objects
Multiple objects can be deparsed using the dump function and  read back in using source.
```r
> x <- "foo"
> y <- data.frame(a = 1, b = "a")
> dump(c("x", "y"), file = "data.R")
> rm(x, y)
> source("data.R")
> y
  a b
1 1 a
> x
[1] "foo"
```

## Connections

Data are read in using *connection* interfaces. Connections can be made to files (most common) or to other more exotic things.

- `file()`, opens a connection to a file
- `gzfile()`, opens a connection to a file compressed with gzip
- `bzfile()`, opens a connection to a file compressed with bzip2
- `url()`, opens a connection to a webpage

```r
> str(file)
function (description = "", open = "", blocking = TRUE, 
	encoding = getOption("encoding"), raw = FALSE,
	method = getOption("url.method", "default")) 
```
- `description` is the name of the file 
- `open` is a parameter where:
	+ “r” read only
	+ “w” writing (and initializing a new file)
	+ “a” appending
	+ “rb”, “wb”, “ab” reading, writing, or appending in binary mode (Windows)

Connections are powerful tools for navigating the files or external objects. But often it won't be needed to deal with its interface directly, like: 
```r
con <- file("foo.txt", "r")
data <- read.csv(con)
close(con)
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbNjI5ODk1OTkyLDcwMDU2MjQ4LC0xNjU5MT
QxNTc1LDE1MDM5OTU2NTUsMjExMTQxNzA2MCwxNzc5NjI2MTcx
LDE4MDc5MTg1NTFdfQ==
-->