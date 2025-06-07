#-------------------------------
#Graphical operations
#-------------------------------

install.packages("ggplot2")
library(ggplot2)
#Author: Hadley Wickham

#Foundation is the Grammar of Graphics (Leland Wilkinson 1999)
#Decomposes graphics into its components: 
#Theme (i.e., the background, not linked to the data)
#Coordinates (defines physical mapping; x- and y-coordinates)
#Facets (panel layout e.g., could look at small subset of data in seperate panel)
#Geometries (determines the plot type e.g., point geometry -> scatterplot; line geometry -> line graph)
#Scales (translate data into co-ordinates e.g., a vertical line ranging from (1,2) to (1,9))
#Statistics (transform the data into values to display e.g., line graph of mean at each time point)
#Mapping (aesthetic mappings: links variables in the data.frame to graphic elements, 
#e.g., variable x is the grouping variable and should be linked to the colour element)
#Data (must be a data.frame)

#geometric objects are added to the 'base' of the ggplot graphic using the + operator:
ggplot(dat, aes(x = x, y = y)) + geom_point() #don't run this

ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()

#Basic geoms: geom_point(), geom_bar(), geom_line(), geom_boxplot()

ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() + ggtitle("Graph title", subtitle = 'subtitle')

#let's try to create a boxplot for mpg on the # of cylinders (cyl)

ggplot(mtcars, aes(factor(cyl), mpg)) + geom_boxplot()

#extract info

info<-ggplot(mtcars, aes(factor(cyl), mpg)) + geom_boxplot()

ggplot_build(info)

#Let's look at other geoms using a different dataset: diamonds
?diamonds
diam <- diamonds[sample(1:nrow(diamonds), 100), ]

#geom_bar 
ggplot(diam, aes(cut)) + 
  geom_bar()

#assign a colour to each factor level  
ggplot(diam, aes(cut, fill=cut)) + 
  geom_bar(width=0.5)

#colour-code according to clarity levels
ggplot(diam, aes(cut)) + 
  geom_bar(aes(fill = clarity))

#geom_line 
ggplot(diam, aes(carat, price)) + geom_line()

ggplot(diam, aes(carat, price, linetype = cut)) + geom_line() 

#------------------------------------------------------
#AESTHETICS
#------------------------------------------------------
#colours
#https://www.r-graph-gallery.com/ggplot2-color.html

#ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point(colour = 'cyan3', size = 2) #name
#ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point(colour = colors()[450], size = 2) #number
#ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point(colour = rgb(0.2, 0.4, 0.2, 1), size = 2) #rgb(red, green, blue, alpha)
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point(colour = '#3FA2CA', size = 2) #hex code

#use gradients to visualize continuous data
ggplot(mtcars, aes(factor(cyl), mpg, colour = drat)) +
  geom_point(position = position_jitter()) +
  scale_colour_continuous(low = 'purple', high = 'white', limits = range(mtcars$drat))

#to colour-define data based on categories, define colour() inside aes() 
ggplot(mtcars, aes(x=wt, y=mpg, colour = factor(cyl))) + geom_point() + geom_point(size = 2)

#If you want to add another factor...(mpg by # cyl & fam)
ggplot(mtcars, aes(wt, mpg, colour = factor(cyl),
                   shape = factor(am))) +
  geom_point(size = 2) + 
  scale_colour_manual(values=c('purple', 'green', 'magenta1')) +
  
  #manually change shape: plus (+), star (*) and diamond
  #https://blog.albertkuo.me/post/point-shape-options-in-ggplot/
  
  scale_shape_manual(values=c(3, 8, 5))

#------------------------------------------------------
#Interactive Graphs
#------------------------------------------------------
install.packages("plotly")
library(plotly)

fig <- plot_ly(data = mtcars, x = ~wt, y = ~mpg)
fig

#more information: https://plotly.com/r/line-and-scatter/

#------------------------------------------------------
#FACETS
#------------------------------------------------------
#let's create two facets to inspect the data by fam (automatic vs manual)
ggplot(mtcars, aes(wt, mpg, colour = factor(cyl))) +geom_point(size = 2) +
  facet_wrap(~factor(am))


