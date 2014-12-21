#Read data
NEI  <- readRDS("summarySCC_PM25.rds")
SCC  <- readRDS("Source_Classification_Code.rds")

#Plot 4 : Across the United States, how have emissions 
#         from coal combustion-related sources changed from 1999-2008?
SCC.coal <- as.vector(SCC$SCC[grepl("Coal", SCC$Short.Name)|grepl("Fuel Comb", SCC$Short.Name)])
NEI.coal <- NEI[NEI$SCC %in% SCC.coal,]

barplot(t(sapply(split(NEI.coal$Emissions, NEI.coal$year), sum)), ylab="PM2.5 emission",
        main="USA Emission trend from Coal Sources")

#Save to png
dev.copy(png, file = "plot4.png")  ## Copy my plot to a PNG file
dev.off() 
