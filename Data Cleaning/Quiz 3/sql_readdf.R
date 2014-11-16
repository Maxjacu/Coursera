library("sqldf")
link <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv" 
acs <- read.csv(link)
a <- sqldf("select pwgtp1 from acs") 
b <- sqldf("select pwgtp1 from acs where AGEP < 50")
c <- sqldf("select * from acs where AGEP < 50 and pwgtp1")


#Which of the following commands will select only the data for the probability weights pwgtp1 with ages less than 50?
#Answer: B

#Question 3
#What is equivalent to unique(acs$AGEP)

k1 <- unique(acs$AGEP)
k1.1<- sqldf("select unique * from acs")
k1.2<- sqldf("select unique AGEP from acs")
k1.3<- sqldf("select distinct AGEP from acs") 

#Answer: k1.3