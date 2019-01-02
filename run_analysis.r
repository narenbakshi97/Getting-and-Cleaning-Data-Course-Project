# Coursera, Johns Hopkins Data Science Program
# Course 3
# Week 4 Assignment 
# Getting and cleaning data
# Author: Naren Bakshi

# Getting the training data
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Getting the training data
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# Sanity check
dim(x_test)
dim(x_train)
dim(y_test)
dim(y_train)
# all is well

# Merges the training and the test sets to create one data set.
# Merging the data
x_final <- rbind(x_test, x_train)
y_final <- rbind(y_test, y_train)
subject_final <- rbind(subject_test, subject_train)

# the data description and activity label
data_description <- read.table("features.txt")
activity_label <- read.table("activity_labels.txt")

# Extracts only the measurements on the mean and standard deviation for each measurement.
filtered <- data_description[grep("mean\\(\\)|std\\(\\)",data_description[,2]),]
x_final <- x_final[,filtered[,1]]

# and, the output
head(x_final)
dim(x_final)


# Uses descriptive activity names to name the activities in the data set
# Setting the label names from activity_label to y_final in a new column
# But first, since we wnat to make it more descriptive, 
#we will rename the column name from V1 to activityNo
names(y_final) <- "activityNo"
# checking if it is changed
names(y_final)
# yep, it is!
y_final$activity <- factor(y_final$activityNo, labels = as.character(activity_label[,2]))
# let's see the results
View(y_final)


# Appropriately labels the data set with descriptive variable names.
names(x_final) <- data_description[filtered[,1],2]
# checking the output
names(x_final)
# selecting only the yCols
labelCol <- y_final[,-1]

# From the data set in step 4, creates a second, independent
#tidy data set with the average of each variable for each activity and each subject.
install.packages("dplyr")
library(dplyr)
names(subject_final) <- "subject"
final_merged <- cbind(x_final, labelCol, subject_final)
mean_final <- final_merged %>% group_by(labelCol, subject) %>% summarize_all(funs(mean))
write.table(mean_final, file = "tidy.txt", row.names = FALSE, col.names = TRUE)
