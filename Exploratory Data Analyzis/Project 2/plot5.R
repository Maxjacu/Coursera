#Read data
NEI  <- readRDS("summarySCC_PM25.rds")
SCC  <- readRDS("Source_Classification_Code.rds")

#Plot 5 : How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 
NEI.B <- NEI[NEI$fips == "24510",]
SCC.mv <- SCC$SCC[SCC$Data.Category == "Onroad"]
NEI.B.mv <- NEI.B[NEI.B$SCC %in% SCC.mv,]

barplot(t(sapply(split(NEI.B.mv$Emissions, NEI.B.mv$year), sum)), ylab="PM2.5 emission",
        main="USA Emission trend from mobile vehicles")


#Save to png
dev.copy(png, file = "plot5.png")  ## Copy my plot to a PNG file
dev.off() 
