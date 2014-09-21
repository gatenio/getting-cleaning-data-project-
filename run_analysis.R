#Getting and Cleaning Data Course Project
#Task
#----------------------
#Here are the data for the project: 
  
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#You should create one R script called run_analysis.R that does the following. 
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#0. Loading files 
#0.1 set working dir 
setwd("F:/Research_Studies/Coursera_EDX/Data specialization/3- Getting and Cleaning Data course/Course Project/UCI HAR Dataset")
getwd()
#0.2 read x_training table
training = read.csv("train/X_train.txt", sep="", header=FALSE)
head(training)
#0.3 merge y_training into training
training[,562] = read.csv("train/Y_train.txt", sep="", header=FALSE)
head(training)
dim(training) #[1] 7352  562
names(training)

#0.4 merge subject_train.txt into training
training[,563] = read.csv("train/subject_train.txt", sep="", header=FALSE)
head(training)
dim(training) #[1] 7352  563

#0.5 testing table loading 
testing = read.csv("test/X_test.txt", sep="", header=FALSE)
head(testing)
dim(testing)   #[1] 2947  561
names(testing)

#0.6 merge Y_test
testing[,562] = read.csv("test/Y_test.txt", sep="", header=FALSE)
head(testing)
names(testing)
dim(testing) #[1] 2947  562

#0.7 merge subject_test.txt
testing[,563] = read.csv("test/subject_test.txt", sep="", header=FALSE)
head(testing)
names(testing)
dim(testing) #[1] 2947  563

#0.8 load activities labels 
Act_Labels = read.csv("activity_labels.txt", sep="", header=FALSE)
head(Act_Labels)
V1                 V2
#1  1            WALKING
#2  2   WALKING_UPSTAIRS
#3  3 WALKING_DOWNSTAIRS
#4  4            SITTING
#5  5           STANDING
#6  6             LAYING
names(Act_Labels)

#0.9.Read "features" .Make cols feature names more appropriate .cleaning dirt.
features = read.csv("features.txt", sep="", header=FALSE)
#?gsub()   gsub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE,fixed = FALSE, useBytes = FALSE)

features[,2] = gsub('-mean', 'Mean', features[,2]) #sustitude -mean to mean
features[,2] = gsub('-std', 'Std', features[,2])  #sustitude -std to std
features[,2] = gsub('[-()]', '', features[,2]) # cancel -()
head(features)

#1. Merge training and test tables-rbind.
#-------------------------------------------
MyData = rbind(training, testing)
head(MyData)
dim(MyData) # [1] 10299   563

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#-------------------------------------
Desired_cols<- grep(".*Mean.*|.*Std.*", features[,2]) # |=or. Mean or Std
features <- features[Desired_cols,] #reduced features
features

# Add two columns to Desired_cols table -subject and activity
Desired_cols <- c(Desired_cols, 562, 563)

#3.  Remove not desired columns from MyData
MyData <- MyData[,Desired_cols]
head(MyData)
names(MyData)
#Add names. Uses descriptive activity names to name the activities in the data set
colnames(MyData) <- c(features$V2, "Activity", "Subject")
colnames(MyData) <- tolower(colnames(MyData))
head(MyData)
names(MyData)

#4.Appropriately labels the data set with descriptive variable names. 
n = 1
for (n_Label in Act_Labels$V2) {
  MyData$activity <- gsub(n, n_Label, MyData$activity)
  n <- n + 1
}
MyData$activity <- as.factor(MyData$activity)
MyData$subject <- as.factor(MyData$subject)

names(MyData)
head(MyData)

#5.From the data set in step 4, creates a second, independent tidy data set 
#with the average of #each variable for each activity and each subject.
tidy_data_set = aggregate(MyData, by=list(activity = MyData$activity, subject=MyData$subject), mean)
tidy_data_set[,90] = NULL
tidy_data_set[,89] = NULL

#?write.table()
write.table(tidy_data_set, "tidy_data_set.txt", sep="\t",row.names = FALSE)




