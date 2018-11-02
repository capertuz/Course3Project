#This script requires the package dplry to be installed and its library to be loaded
#install.packages("dplyr")
library(dplyr)

#1. Create directory and set working environment

filePath <- "C:\\Coursera\\Data Science\\Course 3 Project"
filePathData <- paste0(filePath,"\\data")
# Disable warnings if folder already exists
dir.create(filePathData, showWarnings = FALSE, recursive = TRUE)
setwd(filePathData)

#2. Download file and unzip it

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileName <- paste0("Dataset_", format(Sys.time(), "%m%d%Y%H%M"), ".zip")
download.file(fileUrl, fileName)
unzip(fileName)

#3. Get the data 
#   Assumption: The data was unzipped to the folder ./data/UCI HAR Dataset
filePathDataUnzipped <- paste0(filePathData,"\\UCI HAR Dataset")
setwd(filePathDataUnzipped)

#3.1 Label the data set with descriptive variable names i.e make them human readable 
features <- read.table("features.txt")
features$V2 <- sub("BodyBody","Body",features$V2)
features$V2 <- sub("tBodyAcc","TimeDomainBodyAcceleration",features$V2)
features$V2 <- sub("tGravityAcc","TimeDomainGravityAcceleration",features$V2)
features$V2 <- sub("tBodyGyro","TimeDomainBodyGyro",features$V2)
features$V2 <- sub("fBodyAcc","FrequencyDomainBodyAcceleration",features$V2)
features$V2 <- sub("fBodyGyro","FrequencyDomainBodyGyro",features$V2)
features$V2 <- sub("Mag","Magnitude",features$V2)

#3.2 Get the activities labels 

activity_labels <- read.table("activity_labels.txt",row.names = NULL)

#3.3 Get the core of the data

#3.3.1 Get the test data
filePathDataTest <- paste0(filePathDataUnzipped,"\\test")
setwd(filePathDataTest)
subject_test <- read.table("subject_test.txt",row.names = NULL) #Each element holds the subject ID
X_test <- read.table("X_test.txt",row.names = NULL) #Each row represents all the features for a subject and activity
y_test <- read.table("y_test.txt",row.names = NULL) #Each element holds the activity ID

#3.3.2 Add names and create new variables
colnames(X_test) <- features$V2
X_test$SubjectID <- subject_test$V1 
X_test$ActivityID <- y_test$V1
#X_test$DataType <- "test" #This is optional in case we need to differentitate between test and training data

#3.3.3 Get the training data
filePathDataTrain <- paste0(filePathDataUnzipped,"\\train")
setwd(filePathDataTrain)
subject_train <- read.table("subject_train.txt",row.names = NULL) #Each element holds the subject ID
X_train <- read.table("X_train.txt",row.names = NULL) #Each row represents all the features for a subject and activity
y_train <- read.table("y_train.txt",row.names = NULL) #Each element holds the activity ID

#3.3.4 Add names and create new variables
colnames(X_train) <- features$V2
X_train$SubjectID <- subject_train$V1
X_train$ActivityID <- y_train$V1
#X_train$DataType <- "training" #This is optional in case we need to differentitate between test and training data

#4 Merge the test and training data frames (vertically) to create one data set
X_Total <- rbind(X_test, X_train, make.row.names = FALSE)

#5 Extract the means, standard deviations and the variables added in 3.3.4 and 3.3.2
columNames <- colnames(X_Total)
columnsToKeep <-c(grep("mean()",columNames), grep("std()",columNames), grep("SubjectID",columNames), grep("ActivityID",columNames),grep("DataType",columNames))
X_Total <- X_Total[, columnsToKeep]

#6 Add descriptive activity names to the data set, i.e merge horizontally with activity labels
colnames(activity_labels) <- c("ActivityID", "ActivityDescription")
X_Total <- merge(X_Total, activity_labels, by = "ActivityID")
columnsToDrop <- c("ActivityID", "DataType")
X_Total <- X_Total[, !(names(X_Total) %in% columnsToDrop)]

#7 Create a second data set, with the average of each variable for each activity and each subject
X_Total_Averages_By_SubjectAndActivity <- group_by(X_Total, SubjectID, ActivityDescription) %>% summarise_all(mean)

#8 Save data to disc
setwd(filePathDataUnzipped)
write.table(X_Total,file = "X_Total.txt", eol = "\r\n", row.names = FALSE)
write.table(X_Total_Averages_By_SubjectAndActivity,file = "X_Total_Averages_By_SubjectAndActivity.txt", eol = "\r\n", row.names = FALSE)

