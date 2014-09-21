---
title: "getting-cleaning-data-project"
author: "Gattegno"
date: "Sunday, September 21, 2014"
output: html_document
---
Note: This README.md is written using RStudio 

Project name: Getting and Cleaning Data: Course Project
Description How script works: 

1.Introduction

The repository contains the work for the course project-"Getting and Cleaning data" online Coursera course . 

2.Projects tasks and procedures steps: 

2.1 create one R script called run_analysis.R that does the following. 
2.2 Merges the training and the test sets to create one data set.
2.3 Extracts only the measurements on the mean and standard deviation for each measurement. 
2.4 Uses descriptive activity names to name the activities in the data set
2.5 Appropriately labels the data set with descriptive variable names. 
2.6 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

3. Raw Data source: 
url -https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

4. Downloading process : 
The ziped file downloaded and stored into local working directory setting using setwd(). 

4.Code Input data files list:
The follwing .txt extension file read by the run_analysis.R code. 
The primary task is to creat tidy data set with the average of each variable . 
This was done in the last step of the code. 

4.1 "features_info.txt": Shows information about the variables used on the feature vector.
This txt file describe the experiment used to to measure and recorde the data- i.e "The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals...." See file for further details.  

4.2 "features.txt": List of all features.

4.3 "activity_labels.txt": Links the class labels with their activity name.

4.4 "train/X_train.txt": Training set.

4.5 "train/y_train.txt": Training labels.

4.6 "test/X_test.txt": Test set.

4.7 "test/y_test.txt": Test labels.


The following files are available for the train and test data. Their descriptions are equivalent.

4.8 "train/subject_train.txt": Each row identifies  subject  performe an activity for each  sample. 

4.9"train/Inertial Signals/total_acc_x_train.txt"

4.10 "train/Inertial Signals/body_acc_x_train.txt"

4.11 "train/Inertial Signals/body_gyro_x_train.txt"

5. Implementation of Tasks :  
The code run_analysis.R runs in the following order :
*Load both test and train data . Read file to tables .
*Load the features and activity labels.
*Extract the mean and standard deviation column names and data.
*Process the data. There are two parts processing test and train data respectively.
*Merge data set.
*Write to txt file . 









