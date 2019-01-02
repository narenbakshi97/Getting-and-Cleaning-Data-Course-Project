# Peer-graded Assignment: Getting and Cleaning Data Course Project
Getting and cleaning data Courses's week 4 Assignment project

## Goal of the project
Make the data tider and apply other operations like merging data, labeling, etc.

## Steps taken:
* Downloaded the zip file, heres the file: [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Created run_analysis.R file on RStudio
* Read train and test files via _read.table()_ function
* merged it using _rbind()_ function
* Set the variable names to the columns
* Extracted only the variables which contained mean and stand. deviation variables
* made a new _tidy.txt_ file and stored the newly merged files with adding two variables, Subject and labelCols in it and applied mean to the data by grouping it using labels

## Here were the instructions:
1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
