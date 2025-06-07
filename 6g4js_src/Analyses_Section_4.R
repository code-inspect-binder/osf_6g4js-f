#------------------------------------------------------
#STATISTICAL ANALYSES
#------------------------------------------------------
library(tidyverse)

#------------------------------------------------------
#INDEPENDENT T-TESTS
#------------------------------------------------------
#load and inspect the data
data(iris)
?iris
head(iris)
str(iris)

setosa <- iris %>%
      filter(Species == "setosa") %>%
        select(Petal.Length)

virginica <- iris %>%
  filter(Species == "virginica") %>%
  select(Petal.Length)

#setosa v. virginica
#dv: Petal length
mod.t<-t.test(setosa,virginica, var.equal = F) #var.equal = F 
mod.t
#p<.05

#------------------------------------------------------
#ONE-WAY ANOVA
#------------------------------------------------------
#let's say we're interested in investigating the relationship between three species (setosa, versicolor, virginica)
#outcome: sepal width

#run Levene's test to check assumption of homogeneity of variance
#by default centres variable using median 
#library(car)
#leveneTest(Sepal.Width~Species, data=iris,center=mean)
#p>.05 therefore assumption met 

#running one-way ANOVA 
mod.a<-aov(Sepal.Width~Species, data=iris)
summary(mod.a)

#Since the F-ratio was significant, then at least one group mean is different
#To determine which pairs of groups are different, you can run a post-hoc test

#Post hoc analyses
#Tukey HSD
TukeyHSD(mod.a)

#HOV not met?
#run one-way ANOVA using oneway.test 
#oneway.test(Sepal.Width~Species, data=iris, var=F) #if HOV not met be sure to include var=F
#Rather than Tukey HSD, Games-Howell is typically used as a post-hoc test 
#Since it is based on Welch’s correction to the degrees of freedom
#games_howell_test(iris, Sepal.Width~Species)

#------------------------------------------------------
#REGRESSION
#------------------------------------------------------
reg.mod<-lm(Sepal.Width~Species, data=iris)
summary(reg.mod)


