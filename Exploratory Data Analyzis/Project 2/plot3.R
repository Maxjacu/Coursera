require(ggplot2)
require(data.table)
require(scales)
#Read data
NEI  <- readRDS("summarySCC_PM25.rds")
SCC  <- readRDS("Source_Classification_Code.rds")

#Plot 3 : Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
#         variable, which of these four sources have seen decreases in emissions from 1999-2008
#         for Baltimore City?
NEI.B2 <- data.table(NEI)[, sum(Emissions), by = list(year, type)]
NEI.100 <- NEI.B2[NEI.B2$year == "1999"]
names(NEI.B2)[3] <- "Emissions"
names(NEI.100)[3] <- "Emissions"
for (i in unique(NEI.B2$type)){
  NEI.B2$Emissions[NEI.B2$type == i] <- NEI.B2$Emissions[NEI.B2$type==i]/ NEI.100$Emissions[NEI.100$type==i]
}

c <- ggplot(NEI.B2, aes(factor(year), group=type, col=type, y = Emissions, title="Baltimore,MD Emission trend 1999 - 2008 by type"))
c + geom_line(stat="identity")  + scale_y_continuous(labels = percent) + theme_bw(base_size = 12)+ xlab("Year") + ylab("Emissions PM25, (1999 = 100%)") + theme(legend.title = element_text(face="bold"))+
  scale_color_discrete(name="Type")

 #Save to png
dev.copy(png, file = "plot3.png")  ## Copy my plot to a PNG file
dev.off() 
