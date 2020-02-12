# 1. Merges the training and the test sets to create one data set.
setwd("/Users/LeoPeng/Desktop/JHU Data Science/Course Material/C3_Getting and Cleaning Data/UCI HAR Dataset")

features <- read.table("./features.txt", header=FALSE)
activityLabel <- read.table("./activity_labels.txt", header=FALSE)
colnames(activityLabel)<-c("activityId","activityType")

subjectTrain <-read.table("./train/subject_train.txt", header=FALSE)
xTrain <- read.table("./train/X_train.txt", header=FALSE)
yTrain <- read.table("./train/y_train.txt", header=FALSE)
colnames(subjectTrain) <- "subId"
colnames(xTrain) <- features[,2]
colnames(yTrain) <- "activityId"
trainData <- cbind(yTrain, subjectTrain, xTrain)

subjectTest <-read.table("./test/subject_test.txt", header=FALSE)
xTest <- read.table("./test/X_test.txt", header=FALSE)
yTest <- read.table("./test/y_test.txt", header=FALSE)
colnames(subjectTest) <- "subId"
colnames(xTest) <- features[,2]
colnames(yTest) <- "activityId"
testData <- cbind(yTest, subjectTest, xTest)

finalData <- rbind(trainData,testData)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
colNames <- colnames(finalData)
data_mean_std <-finalData[,grepl("mean|std|subject|activityId", colNames)]

# 3. Uses descriptive activity names to name the activities in the data set
library(plyr)
data_mean_std <- join(data_mean_std, activityLabel, by = "activityId", match = "first")
data_mean_std <-data_mean_std[,-1]

# 4. Appropriately labels the data set with descriptive variable names.

names(data_mean_std) <- gsub("\\(|\\)", "", names(data_mean_std), perl  = TRUE)
names(data_mean_std) <- make.names(names(data_mean_std))

names(data_mean_std) <- gsub("Acc", "Acceleration", names(data_mean_std))
names(data_mean_std) <- gsub("^t", "Time", names(data_mean_std))
names(data_mean_std) <- gsub("^f", "Frequency", names(data_mean_std))
names(data_mean_std) <- gsub("BodyBody", "Body", names(data_mean_std))
names(data_mean_std) <- gsub("mean", "Mean", names(data_mean_std))
names(data_mean_std) <- gsub("std", "Std", names(data_mean_std))
names(data_mean_std) <- gsub("Freq", "Frequency", names(data_mean_std))
names(data_mean_std) <- gsub("Mag", "Magnitude", names(data_mean_std))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
write.table(data_mean_std,file="tidydata.txt")
