df <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", skip=4, strip.white=TRUE, stringsAsFactors=FALSE)
df2 <- df$X.4[df$X.1 != ""]
mean(as.numeric(gsub(",", "", df2)), na.rm=TRUE)




df <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", skip=4, strip.white=TRUE, stringsAsFactors=FALSE)
df2 <- df$X.3[df$X.1 != ""]
grep("*United",df2)
grep("^United",df2)
