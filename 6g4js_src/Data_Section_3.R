# *******************************************************
# Types of Data & Data Structure
# *******************************************************

#' *Atomic Types*
#' There are 6 atomic types of data in R, but, for now you only need to know (and use) 4 of them:
#' 
#' 
#' * Integer (e.g., 1, 2, 10)
#' 
#' 
#' * Numeric (e.g., 3.14, 76.1, 8.0)
#' 
#' 
#' 
#' * Logical (TRUE, FALSE)
#' 
#
#' * Character ("Hello World")
#'
#'
#'
#' *Data Structures*
#' Data structures are ways which R stores data. 
#' Just like the name implies, a data structure tells us exactly how our data is structured 
#' or organized within R. R, like most programming languages, uses a variety of data structures. 
#' The most common of which are:



#' * Vectors
#' A series of data which must have the same data type.
#' Vectors can be any of the basic data types, e.g., logical, integer, numeric, character
vector_example1 <- 1:5
vector_example3 <- c(T, F, T, F, TRUE)
vector_example4 <- c("My", "mom", "is", "a", "teacher")

vector_example1

#'
#'
#' * Factors
#' In R, factors are used to work with categorical variables, variables that have a 
#' fixed and known set of possible values. **Factor is a special case of vector** (data structure).
#' More than in other software, in R we need to explicitly think about the type of the variables when 
#' we do statistical analysis. The following types of variables can be defined or coerced as **factor**:

#'  *Categorical Variables* - These are variables that have distinct, *non-ordered* categories like marital 
#'  status (e.g., single, married, divorced, widowed), names (e.g., Jack, Mimi, Amy, Zoidberg, Zoidberg, Mimi), 
#'  fruit (e.g., apple, orange, watermelon) etc. When a variable that has numeric values as placeholders for 
#'  levels is imported into R, it is good to transform it into a factor so that R doesn't use it as continuous 
#'  variable in statistical analysis. For example, 1= married, 2 = divorced, 3 = single, etc.

#' *Ordinal Variables* - These are categorical variables that have an order like 
#' letter grades (e.g., A+, A, B+,B), tax/income brackets, shoe sizes (e.g., 7, 7.5, 8, 8,5) and 
#' Likert scales (e.g., from 'strongly disagree' to 'strongly agree'). 
#' In R, this "order" is called **levels**.

responses <- as.factor(c("Strongly Disagree", "Disagree", "Agree", "Strongly Agree"))

#' * List
#' A list can have mixed data types, but they can be a bit trickier to use.
list_example <- list("cat", 3, TRUE)


#' * Data frames
#' Used for tabular data, think of them as a basic spreadsheet, but each column is a vector.

dataframe_example <- data.frame(var_A=1:10, var_B=11:20)

#' * Tibbles
#' Similar to data frames with a few differences.
#' Tibbles are the standard data structures within the Tidyverse


# If you are not sure what type of data or data structure an object (or value) is, you can check using:
class(dataframe_example)
class(1.34)
class(TRUE)


# *******************************************************
#' *Importing Data*
# *******************************************************

#' R is very flexible and can import many data formats. RStudio will help you with that, using 
#' necessary packages. In this workshop I will show you how to do it through RStudio and also 
#' through R script. One thing to notice is that if you have a RStudio project in the same 
#' folder where your data sets are, you don't need to specify path addresses to import your data. 
#' R will by default import and save anything on that folder.
#' 
#' 
#' R allows you to read in data from many different formats:
#' * SPSS (.sav)
#' * Excel (.xls, .xlsx, etc.)
#' * SAS
#' * .csv
#' * .txt
#' * .dat

#' The easiest way to get started with reading data into R is go to the environment tab and click on 
#' the import dataset button and then read in the data accordingly (note that csv files are a 
#' type of text file). 


#' Let's start by importing an SPSS dataset (.sav) using the read_sav() function in the 'haven' package:

#' Install the 'haven' package
install.packages("haven")
#' Load the haven package
library(haven)
#' Use read_sav(). You want to make sure the file is saved in the same workspace as your R Script,
#' or set the path to where the data is. And, don't forget to store the data in an object!

aggression_data <- read_sav("aggression.sav")

aggression_data

class(aggression_data) # what data structure is the dataset 

str(aggression_data)  # structure, variables and their data type and structure
head(aggression_data) # inspect the top 6 (head) of the data
tail(aggression_data)

names(aggression_data) # variable/column names



# *******************************************************
#' *Descriptive Statistics*
# *******************************************************
#' 
#' We will be working with the `mtcars` dataset.
#' 
data(mtcars)
#' 
#' ## *Descriptives (Base R)*
#' 
#' 
#' 
names(mtcars)
head(mtcars)
tail(mtcars)
str(mtcars)


# finding the value located in the 2nd row, "mpg" column
mtcars[2, 3] # dataframe_example[Row number/name , Col number/name] 

mtcars[2,"mpg"] 

# You can also look at specific variables using the name of the 
#' dataframe object followed by the `$` operator and the name of the specific column you 
#' would like to inspect.

# looking only at the cyl variable/column
mtcars$mpg

# finding the mpg value in the 2nd observation
mtcars$mpg[2] 


#' This is particularly useful if you want to inspect the descriptives for only one or 
#' a subset of columns. So we could find the mean of a specific column by calling on the mean and 
#' str function and specifying the column we are interested in. We can use this 

# finding the mean mpg of all observations
mean(mtcars$mpg)

# finding the standard deviation of hp
sd(mtcars$hp)

# finding the median of disp
median(mtcars$disp)


# find how many values in mpg
nrow(mtcars)

# plotting mpg vs. wt
plot(mtcars$mpg, mtcars$wt)

hist(mtcars$mpg)

#' We can find most of the common descriptive statistics in base R, 
#' just by coding the function and specifying the specific column we want to summarize. 
#' Other common descriptives are `range()`, `median()`, `mode()`, etc. 
#' However, it can be incredibly cumbersome to analyze multiple variables using a line 
#' of code for each fit stat. 
#'
#'
#' This dataset has 11 variables, so even to find the mean and standard deviation for each 
#' would require 22 lines of code without use of a simpler method. This method is most useful 
#' for quickly pulling specific stats from specific columns. 
#'
#' If you want to describe your whole dataset, it would be a lot more efficient to use a single function. 
#' The `describe` function in the `psych` package is one of the simplest ways to take care of this.
#' 
#' 
#'
#' ## *Descriptives (psych and car packages)*
#' 
#' 
#' 
#' Loading Packages
install.packages("psych")
install.packages("car")
install.packages("tidyverse")
library(psych)
library(car)
library(tidyverse)


#'
#' *psych::describe*
#' By default, missing values will be removed. If you would like missing values to be included, 
#' you can add `na.rm = FALSE` to the code.
#' 
#' The `describe()` function will provide all of the most common descriptive statistics including mean, 
#' median, mode, standard deviation, etc. as well as skew and kurtosis to provide an idea of the shape 
#' of the distribution

describe(mtcars)



#' ## *Descriptives by Grouping Variable*

#' If your dataset includes a grouping variable, you can also find descriptives by group level. 
#' So in this dataset, the 'am' variable is coded as 0 or 1 to indicate the car has an 
#' automatic (0) or manual (1) transmission. This 'dummy coding' means that it can be used as a 
#' grouping variable. We can therefore look at the means of other variables between types of transmission.

names(mtcars)

describeBy(mtcars, group = 'am')

#' As you can see from the output of the above code, we now have 2 sets of descriptive statistics, 
#' one for **am: 0** and another for **am: 1**.
#' 
#' A big part of descriptive statistics and getting to know our data better is graphing. 
#' But, we will get to that later.



# *******************************************************
#' *Data Manipulation Using the Tidyverse*
# *******************************************************
#' 
#' The `tidyverse` is an opinionated collection of R packages designed for data science. 
#' All packages share an underlying design philosophy, grammar, and data structures.
#' 
#' The powerhouse package for doing data wrangling is 
#' called `dplyr` (part of `tidyverse`). We will be learning how to use the `dplyr` package to 
#' find different ways to present and transform our data. 
#' 
#' `dplyr` provides a simple set of “verb” functions that make basic data manipulation easier.
#' There are 6 primary functions in the dplyr toolkit:
#'
#' ## *Main Functions*

#' filter() … filters rows (creates a subset of individuals but preserves all variables)
#' 
#' select()` … selects columns (creates a subset of variables but preserves all individuals)
#' 
#' arrange() …  sorts the data in ascending or descending order
#' 
#' mutate() … adds new variables to your dataset 
#' 
#' group_by() … creates a grouping variable so that you can obtain 
#' summary statistics separately for each group on a particular variable (usually used with `summarise`)
#' 
#' summarise()` … calculates summary statistics - this is typically used in conjuction with some combination of the other 5 functions above to calculate means, SDs, frequencies etc. 


# But, wait...

#' ## *Introduction of the 'pipe' %>% *
#' 
#' 
#' 
#' There are a couple of different ways to use the `dplyr` functions. 
#' All of them take as their first argument, the name of the dataset that you want to manipulate. 
#' 
#' Example: Your data is called "dataset" and you have variables x1, x2, x3
#' to sort the dataset in increasing order for on x1 you would use:
arrange(dataset, x1)

# For example, 

arrange(mtcars, mpg)


#' But instead of having to start every function with the name of the dataset, 
#' dplyr can also use a 'pipe' to list the dataset outside of the function. 
#' The pipe is represented by the symbol:  `%>%` (percent, greater than, percent). 
#' 
#' Here's the approach using the pipe, that achieves the same result as the code example above. 

dataset %>%
  arrange(x1)

# For example:

mtcars %>%
  arrange(mpg)

#' With a single function, there is minimal benefit to this approach, 
#' but it is meant to be used in a chain of commands. So if for example, you wanted to 
#' sort the dataset using arrange, then filter based on some criteria, then create a new 
#' variable using mutate, you can use the pipe in a chain of commands like: 


dataset %>%
  arrange(...)  %>%
  filter(... ) %>%
  mutate(...)


#' In English, you could read the `%>%` symbol as the word "and then". 
#' E.g., take "dataset" **and then** arrange based on some variable, **and then** filter based on 
#' some other variable, **and then** mutate based on some third variable.


#' Good illustration of the pipe `%>%`
#' <https://github.com/arthurwelle/VIS/blob/master/Pipe_Cake/Pipe_baking_magrittr.gif> 
# Or, open the gif in the folder.



#' ## *arrange()*
#' 
#' 
mtcars %>%
  arrange(mpg) # sort on mpg from lowest to highest

mtcars %>%
  arrange(desc(mpg)) # sort on mpg from highest to lowest



#' Remember that R is object based, and we did not create a new object that *saves the sorting*. 
#' To preserve the sorting in our dataset we have to either over-ride our df dataset or 
#' create a second version of our df dataset. E.g.: 

mtcars2 <- mtcars %>%
  arrange(mpg)


#' With `arrange`, saving a new dataset is trivial because there will be no effects on your statistics, 
#' but it non-trivial if you start filtering and transforming variables, and then want to use this 
#' transformed dataset in an analysis. 
#' Note you can also sort across multiple variables. Note that the order matters because it sorts 
#' on the first variable first, then the next one, then the next one...etc.


#' ## *select()*
#' 
#' 
#' This function helps you work with a smaller version of your dataset (on the variable side). 
#' This can save you time so you don't have to scroll through to find the exact names of your variables 
#' (remember R is case sensitive so it has to be a perfect match). Our dataset has a small number of 
#' variables so it is already manageable but we will still see how to use the select function.
#' 
#' 
#' **NOTE:** There is one really annoying issue with select() that may come up for you. 
#' select() is also the name of a function from the MASS package and MASS is loaded by default so R often 
#' wants to use that function instead. 
#' 
#' If you use ?select you will see it come up for two packages
#' 
#' There are two ways you can fix this:

mtcars.sub <-  mtcars %>% 
      select(mpg, cyl) # tells R to use the select function from dplyr in this case only

mtcars.sub



#' ## *filter()*
#' 
#' 
#' 
#' filter() allows you to work with a smaller number of rows in your dataset based on a commonality. 
#' You can also think of this as subsetting your data to include participants with particular characteristics. 
#' Here is where you will be using logical data because you need to tell filter() not just the variable 
#' you want to filter on, but also the particular conditions or values. 
#' 
#' 
#' Here are some examples:


# only show observations with cars that have 3 gears

mtcars %>%
  filter(gear == 3)  # note that you need two equal signs

# at or more than 4 cylinders 

mtcars %>%
  filter(cyl >= 4) # greater than or equal to


# How about equal/greater than 4 cylinders in descending order?

mtcars %>%
  filter(cyl >= 4) %>%
  arrange(desc(cyl))


# You can also filter on multiple conditions:

# Only vehicle weight larger than 3 tons AND are manual (am==1)
mtcars %>%
  filter(wt > 3 & am ==1)  # both of these have to be true

# Only vehicle weight larger than 3 tons OR are manual (am==1)

mtcars %>%
  filter(wt > 3 | am ==1) # only one of these needs to be true


# you could also say what you do NOT want

mtcars %>%
  filter(gear != 4 ) # != means not equal to



#' ## *mutate()*
#' 
#' 
#' mutate() is used when you want to create a **new** variable in your dataset. 
#' For example, we may want to using log transformation on the mpg variable, 
#' but we don't want to override the original variable


new_mtcars <- mtcars %>%
  mutate(log_mpg = log(mpg))

new_mtcars



#' ## *summarise()* and *group_by()*
#' 
#' 
#' summarise() is most often used to get descriptive statistics **at the end of the pipeline** for 
#' particular subgroups, aggregates of groups, frequency counts, etc. How summarise() differs
#' from regular summary statistics of functions like summary(), describe(), etc. 
#' is that the output itself is also a tibble that you could use in future analysis. 
#' Generally speaking, where I would find it more useful is if you need to use a series of data 
#' manipulation functions in the pipeline to get exploratory statistics for different groups or 
#' want to check something quickly. 

#' You can use it for general descriptive statistics if you want very specific pieces of information 
#' as well (especially used in conjunction with group_by() )
#' 
#' You can find a list of useful functions to use in summarise here: [https://dplyr.tidyverse.org/reference/summarise.html]


mtcars %>%
  group_by(gear) %>%
  summarise(mean(wt))


mtcars %>%
  group_by(gear) %>%
  summarise(sd(hp))


# For more on data wrangling check out this great (free) online book: R 4 Data Science
#' <https://r4ds.had.co.nz/>

