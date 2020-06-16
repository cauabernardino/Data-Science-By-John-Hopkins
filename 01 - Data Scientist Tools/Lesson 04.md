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
suH~2~O - `H~2~O`
10^2^ - `10^2^`
equation: $A = \pi*r^{2}$
> quoted text - `> quoted text`

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTExMTY5NTg0MSwyMTI5NDgyNTE3LC0xMT
c4NDA0NDMxXX0=
-->