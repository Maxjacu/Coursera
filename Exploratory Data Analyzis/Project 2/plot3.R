require(ggplot2)
require(data.table)
#Read data
NEI  <- readRDS("summarySCC_PM25.rds")
SCC  <- readRDS("Source_Classification_Code.rds")

#Plot 3 : Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
#         variable, which of these four sources have seen decreases in emissions from 1999-2008
#         for Baltimore City?
NEI.B2 <- data.table(NEI)[, sum(Emissions), by = list(year, type)]
names(NEI.B2)[3] <- "Emissions"

c <- ggplot(NEI.B2, aes(factor(year), y = Emissions, title="Baltimore,MD Emission trend 1999 - 2008 by type"))
c + geom_bar(stat="identity",  ) + facet_wrap(~ type)

#Save to png
dev.copy(png, file = "plot3.png")  ## Copy my plot to a PNG file
dev.off() 
