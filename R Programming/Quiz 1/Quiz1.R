##############
#Question 1  #
#Read CSV
df <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")
count(df$VAL==24)

##############
#Question 3  #
#Read from Excel
dat <- read.xlsx2("getdata_data_DATA.gov_NGAP.xlsx", startRow=18, endRow=23, sheetIndex=1)

#Convert Factors to numeric
dat$Zip <- as.numeric(levels(dat$Zip))[dat$Zip]
dat$Ext <- as.numeric(levels(dat$Ext))[dat$Ext]

#Function 
sum(dat$Zip*dat$Ext,na.rm=T) 

##############
#Question 4  #

#Read xml
xml <- xmlTreeParse("getdata_data_restaurants.xml")
str(xml)
xml[[1]][[1]][[1]][[1]]
#unfinished
xpathSApply(xml[[1]][[1]][[1]][[1]],"//zipcode", xmlValue)


##############
#Question 4  #

dt <- fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")

DT <- dt
benchmark(sapply(split(DT$pwgtp15,DT$SEX),mean))
benchmark(mean(DT$pwgtp15,by=DT$SEX))
benchmark(tapply(DT$pwgtp15,DT$SEX,mean) )
benchmark(mean(DT[DT$SEX==1,]$pwgtp15))
benchmark(mean(DT[DT$SEX==2,]$pwgtp15))
benchmark(DT[,mean(pwgtp15),by=SEX])
benchmark(mean(DT$pwgtp15,by=DT$SEX))