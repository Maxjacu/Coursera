setwd("C:/Users/PC/Documents/Coding/Coursera/Exploratory Data Analyzis/Project 2")

#Read data
NEI  <- readRDS("summarySCC_PM25.rds")
SCC  <- readRDS("Source_Classification_Code.rds")

#Plot 1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
barplot(t(sapply(split(NEI$Emissions, NEI$year), sum)), ylab="PM2.5 emission")

#Save to png
dev.copy(png, file = "plot1.png")  ## Copy my plot to a PNG file
dev.off() 
