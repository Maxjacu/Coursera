require(ggplot2)
require(data.table)
require(scales)
#Read data
NEI  <- readRDS("summarySCC_PM25.rds")
SCC  <- readRDS("Source_Classification_Code.rds")

#Plot 6: Compare emissions from motor vehicle sources in Baltimore City with emissions 
#       from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#       Which city has seen greater changes over time in motor vehicle emissions?
NEI.BL <- NEI[NEI$fips == "24510" | NEI$fips == "06037",]
SCC.mv <- SCC$SCC[SCC$Data.Category == "Onroad"]
NEI.BL.mv <- NEI.BL[NEI.BL$SCC %in% SCC.mv,]
NEI.BL.mv$fips[NEI.BL.mv$fips != 24510] <- "Los Angeles County, CA"
NEI.BL.mv$fips[NEI.BL.mv$fips == 24510] <- "Baltimore, MD"
NEI.BL.mv <- data.table(NEI.BL.mv)[, sum(Emissions), by = list(year, fips)]
names(NEI.BL.mv)[3] <- "Emissions"

NEI.BL.mv.100 <- NEI.BL.mv[NEI.BL.mv$year == "1999"]
for (i in unique(NEI.BL.mv$fips)){
  NEI.BL.mv$Emissions[NEI.BL.mv$fips == i] <- NEI.BL.mv$Emissions[NEI.BL.mv$fips==i]/ 
    NEI.BL.mv.100$Emissions[NEI.BL.mv.100$fips==i]
}

c <- ggplot(NEI.BL.mv, aes(factor(year), group=fips, col=fips, y = Emissions, title="Emission trend of two Regions"))
c + geom_line(stat="identity")  + scale_y_continuous(labels = percent) + theme_bw(base_size = 12)+ xlab("Year") + ylab("Emissions PM25, (1999 = 100%)") + theme(legend.title = element_text(face="bold"))+
  scale_color_discrete(name="Region")

#Save to png
dev.copy(png, file = "plot6.png")  ## Copy my plot to a PNG file
dev.off() 
