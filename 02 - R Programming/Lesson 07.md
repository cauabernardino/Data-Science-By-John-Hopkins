
# Overview and History of R

R is a dialect of the S language. S is a language that was developed by John Chambers and others at Bell Labs, iniated in 1976.

R was created in 1991, in New Zealand by Ross Ihaka and Robert Gentleman. Their experience developing R is documented in a 1996 JCGS paper. In 1995 it was used the GNU General Public License to make R free software.

## Features of R

From the lecture notes:
> - Syntax is very similar to S, making it easy for S-PLUS users to switch over. 
>- Semantics are superficially similar to S, but in reality are quite different (more on that later). 
>- Runs on almost any standard computing platform/OS (even on the PlayStation 3) 
>- Frequent releases (annual + bugfix releases); active development. 
>- Quite lean, as far as software goes; functionality is divided into modular packages 
>- Graphics capabilities very sophisticated and better than most stat packages. 
>- Useful for interactive work, but contains a powerful programming language for developing new tools (user -> programmer) 
>- Very active and vibrant user community; R-help and R-devel mailing lists and Stack Overflow

## Design of the R System

The R system is basicly dived into 2 conceptual parts: the "base" R and everything else.

R functionality is divided into a number of packages.
>- The “base” R system contains, among other things, the base package which is required to run R and contains the most fundamental functions. 
> -The other packages contained in the “base” system include *utils*, *stats*, *datasets*, *graphics*, *grDevices*, *grid*, *methods*, *tools*, *parallel*, *compiler*, *splines*, *tcltk*, *stats4*. 
> - There are also “Recommend” packages: *boot*, *class*, *cluster*, *codetools*, *foreign*, *KernSmooth*, *lattice*, *mgcv*, *nlme*, *rpart*, *survival*, *MASS*, *spatial*, *nnet*, *Matrix*.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE5MzkzMjU1MDUsLTE3OTY3OTAxNCw3Mz
A5OTgxMTZdfQ==
-->