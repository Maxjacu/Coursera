df <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", skip=4, strip.white=TRUE, stringsAsFactors=FALSE)
colnames(df)[1:2] <- c("CountryCode", "Rank")
df<- df[!(is.na(df$Rank) | df$Rank==""), ]
df$Rank <- as.numeric(df$Rank, na.rm=TRUE)
df2 <-  read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", stringsAsFactors=FALSE)
mergedData<-merge(df, df2, by="CountryCode", by.y="CountryCode", all=FALSE)
mergedData<- arrange(mergedData, desc(mergedData$Rank))
str(mergedData)
