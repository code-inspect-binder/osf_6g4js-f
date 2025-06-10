#Section 1 (Basics) 

#The working directory in R is the folder in which you are working in 
#If you want to change it, you can go to Files > Desktop > [folder name]
#Click on 'More' and 'Set As Working Directory'

#RStudio layout 
#Four panels: source, console, environment, files
#Comments are any text that are hashed out 
#You can change the theme of RStudio via Tools > Global Options > Apperance

#Simple operations 

'
* is for multiplication
/ is for division
^ or ** is for exponentiation
'

1+2
7-3
5*8
1/3
3^3
2+5*5^3
((2+5)*5)^3

'
Relational Operators
< is for less than
> is for greater than
== is for equal to
<= is for less than or equal to
>= is for greater than or equal to
!= NOT equal to
'

1<5
2>3
6 == 6
3<=9
5>=9
(8/2)!=(2*2)

'
Logical Operators
! is for NOT
& is for element-wise AND
&& is for AND
| is for OR
'
(16 & 4) == 4
(4 | 5) < 10 

#What are R packages?
#A package bundles together related functions (i.e., related statistical tests)
#R packages can be accessed through the centralised software repository CRAN 
#(the Comprehensive R Archive Network)
#Currently, the CRAN package repository features 18562 available packages.
#https://cran.r-project.org/web/packages/available_packages_by_name.html#available-packages-P

install.packages()

#Example: negligible package 

install.packages("negligible")
library(negligible)

#Base-R is the basic software which contains the R programming language. 
#Base-R functions:
#https://stat.ethz.ch/R-manual/R-devel/library/base/html/00Index.html

x<-1:10

sum(x)
range(x)
mean(x)
sd(x)
median(x)

#built-in data sets: 
#mtcars: data extracted from the 1974 Motor Trend US magazine, comprises fuel consumption and 10 aspects of automobile design and performance 

data()

data(mtcars)
head(mtcars)




