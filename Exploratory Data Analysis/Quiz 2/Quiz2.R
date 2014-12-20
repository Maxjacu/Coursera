#Question 2
library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)


#Question 4
library(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)

#Question 7
library(datasets)
data(airquality)
library(ggplot2)
#plot 1
qplot(Wind, Ozone, data = airquality, geom = "smooth")
#plot 2: I am interested in examining how the relationship between ozone and wind speed varies across each month
airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

#Question 9
library(ggplot2)
g <- ggplot(movies, aes(votes, rating))
print(g)

#Question 10
qplot(votes, rating, data = movies)
qplot(votes, rating, data = movies) + geom_smooth()

