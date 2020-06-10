# Lesson 02 - R Language

R is both a programming language and an environment, focused mainly on statistical analysis and graphics.

R is downloaded from the [Comprehensive R Archive Network (CRAN)](https://cran.r-project.org/).

## Why should you use R?

1. Popularity - which means new functionalities developed with frequency and better support
2. R is **free**
3. Versatility - can make websites, maps using GIS data, etc.
4. R has a very active community

## Installing R and RStudio

There's a tutorial on the course, but there's plenty on the internet as well. I'll leave this recent Data Camp tutorial that is very complete and easy:
[How to Install R on Windows, Mac OS X, and Ubuntu](https://www.datacamp.com/community/tutorials/installing-R-windows-mac-ubuntu)

RStudio is one of the most popular GUI for R and will be the one used here. There's a [RStudio Cheatsheet](https://github.com/rstudio/cheatsheets/raw/master/rstudio-ide.pdf) to help understand more about its environment.

## R Packages

Packages are collection of functions, data and code developed by the people in R community to help expand and/or accelerate the basic R funcionalities. They often are deposited in repositories like

- [CRAN](https://cran.r-project.org/web/packages/): R's main repository
- [BioConductor](https://bioconductor.org/packages/release/BiocViews.html#___Software): A repository mainly for bioinformatic-focused packages
- [GitHub](https://github.com/collections): Of course
- [RDocumentation](https://www.rdocumentation.org/): Definitely the one to use, aggregating all the other big three repositories

### Installing packages

To install a package from CRAN repository is used `install.packages()`, with the name of the package in single or double quotes, between the parentheses. Also it is possible to install multiple packages using a character vector. For last, is used `library()` to *load* the package. Examples below.

```r
install.packages("ggplot2")
install.packages(c("ggplot2", "devtools", "lme4"))
library(ggplot2)  # library() function does not need quotes
```

To install a package from Bioconductor:
```r
source("https://bioconductor.org/biocLite.R")  # Get the function
biocLite()  # Function 
biocLite("GenomicFeatures")  # Example
```

To install a package from GitHub:
```r
install.packages("devtools")
library(devtools)
install_github("author/package") # author: GitHub username, package: its name
```
### Managing packages

Use `library()`, with no parameters inside it, to check what packages are installed.

If, for any reason, it is needed to *unload* a package, use `detach()`, as example below:
```r
detach("package:ggplot2", unload=TRUE)
```

To delete a package use:
```r
remove.packages("ggplot2")
```

To avoid any version problems between packages and the language itself, there are some commands that help to keep track of it
```r
version  # Check 
```



> Written with [StackEdit](https://stackedit.io/).
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTYwOTU3NTM4MiwtMjAzMzg2MjI4NCwtMj
Q4NzEwNDgyLDkzOTE2NTgxOSwxODgyMzY1OTc4LDM1MjEyNjY0
NSwtMjEyMzE0MDYxNiwtNjUzMDczMDI5LC05MzkxMTQ4NzRdfQ
==
-->