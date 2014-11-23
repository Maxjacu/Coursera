library("plyr", lib.loc="C:/Users/z002hezy/AppData/Local/R")
df <- read.csv("getdata_data_GDP.csv", skip=4, strip.white=TRUE, stringsAsFactors=FALSE)
colnames(df)[1:2] <- c("CountryCode", "Rank")

df<- df[!(is.na(df$Rank) | df$Rank==""), ]
df$Rank <- as.numeric(df$Rank, na.rm=TRUE)
df2 <-  read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", stringsAsFactors=FALSE)
mergedData<-merge(df, df2, by="CountryCode", by.y="CountryCode", all=FALSE)
mergedData<- arrange(mergedData, desc(mergedData$Rank))
#Next Question
#What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group? 
count(mergedData$Income.Group)
mean(mergedData$Rank[mergedData$Income.Group == "High income: OECD"])
mean(mergedData$Rank[mergedData$Income.Group == "High income: nonOECD"])

#Next Question
#Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. 
#How many countries are Lower middle income but among the 38 nations with highest GDP?


quant <- quantile(mergedData$Rank, probs=c(.2,.4,.6,.8,1))
quant <- as.numeric(quant)
arrange()
mergedData$inc = cut(mergedData$Income.Group, breaks = quant)
count(mergedData$Income.Group[mergedData$Rank <39])
