#1. Combine Data
#1.1 Read from files
table.test.x <- read.table("test/X_test.txt")
table.test.y <- read.table("test/y_test.txt")
table.test.subject <- read.table("test/subject_test.txt")
table.train.x <- read.table("train/X_train.txt")
table.train.y <- read.table("train/y_train.txt")
table.train.subject <- read.table("train/subject_train.txt")
table.train.x.title <- read.table("features.txt")

#1.2 Combine test and train data 
table.subject <- rbind(table.test.subject, table.train.subject)
table.x <- rbind(table.test.x, table.train.x)
table.y <- rbind(table.test.y, table.train.y)

#Remove unused data frames
rm(table.test.x, table.test.y, table.test.subject)
rm(table.train.x, table.train.y, table.train.subject)

#2 Mean and Standard Deviation of all variables in table.x and combine to one data frame (df)
df <- cbind(table.subject, table.y, table.x[grep("mean\\(\\)|std\\(\\)", table.train.x.title[,2])])

#3 Descriptive Activity Names
df[,2][df[,2] == 1] <- "Walking"
df[,2][df[,2] == 2] <- "Walking_Upstairs"
df[,2][df[,2] == 3] <- "Walking_Downstairs"
df[,2][df[,2] == 3] <- "Sitting"
df[,2][df[,2] == 5] <- "Standing"
df[,2][df[,2] == 6] <- "Laying"

#4  Labels the data set with descriptive variable names. 
colnames(df)[1:2]<-c("Subject", "Activity",  table.train.x.title[,2])

#5 Create Aggregated Dataset from data frame df
#Split df to each Activity
Activity.split <- split(df, df$Activity)
#Calculate mean of variables for each subject within each activity
df.agg<- data.frame()
for(i in 1:6){
  data <- data.frame(Activity.split[i])
  colnames(data) <- ("")
  df.agg2 <- aggregate(data[-2], list(Subject = data[,1]), mean)
  df.agg2<- df.agg2[-2]
  df.agg2 <- as.data.frame(append(df.agg2, list(Activity = data[1,2]), after = 1))
  df.agg <-rbind(df.agg, df.agg2)
}
#Drop dublicate coloumn and rename coloumn 
colnames(df.agg)<-colnames(df)

write.table(df.agg, "tidydata.txt",row.name=FALSE) 
<<<<<<< HEAD
=======
write.table(colnames(df), "features_short.txt",row.name=FALSE) 
>>>>>>> origin/master


