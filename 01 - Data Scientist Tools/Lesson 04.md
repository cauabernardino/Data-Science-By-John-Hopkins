# R Markdown

R Markdown is a way of creating fully reproducible documents, in which both text and code can be combined.

To use R Markdown, we nee to install it with `install.packages("rmarkdown")`. In RStudio it can be created going to File > New File > R Markdown.

To save the file and export to the desired output (PDF, HTML or Word), use the **Knit** command in the script area. If there is an error saying that LaTeX is misssing, install TinyTex with `tinytex::install_tinytex()` on the console to solve the problem.

To see more information about it, check [here](https://rmarkdown.rstudio.com/).

## Basic commands

The basic formatting commands are as follows:

*italic* - `*italic*`
**bold** - `**bold**`
~~strikethrough~~ - `~~strikethrough~~`
subscript: H~2~O - `H~2~O`
superscript: 10^2^ - `10^2^`
equation: $A = \pi*r^{2}$ - `$A = \pi*r^{2}$`
> quoted text - `> quoted text`

Headers:
```
# Header level 1
## Header level 2
### Header level 3...
```
unordered list: 
- item - `- item`

ordered list:
1. item - `1. item`
2. item - `2. item`

To make an R code chunk, you can type the three backticks, followed by the curly brackets surrounding a lower case R, put your code on a new line and end the chunk with three more backticks (check the standard file when you create a new R Markdown in RStudio).

To know more, there is the [R Markdown Cheat Sheet](https://rstudio.com/wp-content/uploads/2016/03/rmarkdown-cheatsheet-2.0.pdf) to help.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE1NTgxMjc1MDksLTE1NTgxMjc1MDksLT
ExODYxNjEyODAsMjEyOTQ4MjUxNywtMTE3ODQwNDQzMV19
-->