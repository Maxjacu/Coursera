Coursera Data Cleaning Project 
========
The objective of this project is to 'clean' raw data and combine it into one table (Steps 1-4)
In addition a aggregated table will be created (Step 5) based on the table created in the previous steps.
The R script is called "run_analysis.R"

#1. Combine test and training data 
1.1 Read from files X_test.txt, Y_test.txt and subject_test.txt from both folders "test" and "training". In addition read "features.txt" for naming of X_test.txt coloumns.

1.2 Combine test and train data 

#2. Extracts only the measurements on the mean and standard deviation for each measurement
The script filtes the coloumns with mean() and std() in its title (from features.txt)

#3. Add descriptive Activity Names
I used the activity names found in "activity_labels.txt"

#4. Labels the data set with descriptive variable names. 
- Coloumn with Subject number in it renamed to "Subject"
- Coloumn with Activities  in it renamed to "Activities"
- Variable names are taken from "features.txt"

#5. Create table with average of each variable for each activity and each subject of previously created data frame
Script splits data frame into 6 sub-data frames. One for each Activity
It calculates the mean of variables for each subject within each activity
It drops dublicate coloumn and rename coloumns back
Save aggregate table into  tidydata.txt



