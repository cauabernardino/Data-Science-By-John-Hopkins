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
- skip, the number of lines to skip from the beginning
- stringsAsFactors, should character variables be coded as factors?
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTkzMjA1NDcxNiwxNzc5NjI2MTcxLDE4MD
c5MTg1NTFdfQ==
-->