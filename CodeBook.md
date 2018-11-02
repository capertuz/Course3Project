# Code Book

## Information about the variables

The variables on the data sets included in this repository come from the original data set described on the website 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

This is the description of the data set per the website:
“The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.”

According to the original documentation the numeric data has been “normalized and bounded within [-1,1].”

The units of the body acceleration data are” in standard gravity units ‘g’, the signal was obtained  by subtracting the gravity from the total acceleration”

The units of the gyroscope variables are radians/second which are valid for angular velocity measurements

## Summary choices

The original data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and reshaped using the script run_analysis.R. To get the new data sets the script was executed in RStudio Version 1.1.456  on a PC running Windows 10 Home.
The script needs access to the C drive of the computer and needs Rstudio to have the package dplyr installed.
The original variable names had condensed names and the script modifies them to be descriptive. The following list shows how the substrings in all the variable names were expanded 

-	"tBodyAcc” substring was expanded to “TimeDomainBodyAcceleration”
-	"tGravityAcc” substring was expanded to “TimeDomainGravityAcceleration”
-	"tBodyGyro” substring was expanded to “TimeDomainBodyGyro”
-	"fBodyAcc” substring was expanded to “FrequencyDomainBodyAcceleration”
-	"fBodyGyro” substring was expanded to “FrequencyDomainBodyGyro”
-	"Mag” substring was expanded to “Magnitude”

Two data sets, X_Total and X_Total_Averages_By_SubjectAndActivity, result from running the script; the names of the variables in both data sets are the same, however, the data on X_Total_Averages_By_SubjectAndActivity comes from grouping by SubjectID and ActivityDescription the data in X_Total and then averaging the values.

## Variable Names

This list contains all the variables in the data sets:

-	SubjectID
-	ActivityDescription
-	TimeDomainBodyAcceleration-mean()-X
-	TimeDomainBodyAcceleration-mean()-Y
-	TimeDomainBodyAcceleration-mean()-Z
-	TimeDomainGravityAcceleration-mean()-X
-	TimeDomainGravityAcceleration-mean()-Y
-	TimeDomainGravityAcceleration-mean()-Z
-	TimeDomainBodyAccelerationJerk-mean()-X
-	TimeDomainBodyAccelerationJerk-mean()-Y
-	TimeDomainBodyAccelerationJerk-mean()-Z
-	TimeDomainBodyGyro-mean()-X
-	TimeDomainBodyGyro-mean()-Y
-	TimeDomainBodyGyro-mean()-Z
-	TimeDomainBodyGyroJerk-mean()-X
-	TimeDomainBodyGyroJerk-mean()-Y
-	TimeDomainBodyGyroJerk-mean()-Z
-	TimeDomainBodyAccelerationMagnitude-mean()
-	TimeDomainGravityAccelerationMagnitude-mean()
-	TimeDomainBodyAccelerationJerkMagnitude-mean()
-	TimeDomainBodyGyroMagnitude-mean()
-	TimeDomainBodyGyroJerkMagnitude-mean()
-	FrequencyDomainBodyAcceleration-mean()-X
-	FrequencyDomainBodyAcceleration-mean()-Y
-	FrequencyDomainBodyAcceleration-mean()-Z
-	FrequencyDomainBodyAcceleration-meanFreq()-X
-	FrequencyDomainBodyAcceleration-meanFreq()-Y
-	FrequencyDomainBodyAcceleration-meanFreq()-Z
-	FrequencyDomainBodyAccelerationJerk-mean()-X
-	FrequencyDomainBodyAccelerationJerk-mean()-Y
-	FrequencyDomainBodyAccelerationJerk-mean()-Z
-	FrequencyDomainBodyAccelerationJerk-meanFreq()-X
-	FrequencyDomainBodyAccelerationJerk-meanFreq()-Y
-	FrequencyDomainBodyAccelerationJerk-meanFreq()-Z
-	FrequencyDomainBodyGyro-mean()-X
-	FrequencyDomainBodyGyro-mean()-Y
-	FrequencyDomainBodyGyro-mean()-Z
-	FrequencyDomainBodyGyro-meanFreq()-X
-	FrequencyDomainBodyGyro-meanFreq()-Y
-	FrequencyDomainBodyGyro-meanFreq()-Z
-	FrequencyDomainBodyAccelerationMagnitude-mean()
-	FrequencyDomainBodyAccelerationMagnitude-meanFreq()
-	FrequencyDomainBodyAccelerationJerkMagnitude-mean()
-	FrequencyDomainBodyAccelerationJerkMagnitude-meanFreq()
-	FrequencyDomainBodyGyroMagnitude-mean()
-	FrequencyDomainBodyGyroMagnitude-meanFreq()
-	FrequencyDomainBodyGyroJerkMagnitude-mean()
-	FrequencyDomainBodyGyroJerkMagnitude-meanFreq()
-	TimeDomainBodyAcceleration-std()-X
-	TimeDomainBodyAcceleration-std()-Y
-	TimeDomainBodyAcceleration-std()-Z
-	TimeDomainGravityAcceleration-std()-X
-	TimeDomainGravityAcceleration-std()-Y
-	TimeDomainGravityAcceleration-std()-Z
-	TimeDomainBodyAccelerationJerk-std()-X
-	TimeDomainBodyAccelerationJerk-std()-Y
-	TimeDomainBodyAccelerationJerk-std()-Z
-	TimeDomainBodyGyro-std()-X
-	TimeDomainBodyGyro-std()-Y
-	TimeDomainBodyGyro-std()-Z
-	TimeDomainBodyGyroJerk-std()-X
-	TimeDomainBodyGyroJerk-std()-Y
-	TimeDomainBodyGyroJerk-std()-Z
-	TimeDomainBodyAccelerationMagnitude-std()
-	TimeDomainGravityAccelerationMagnitude-std()
-	TimeDomainBodyAccelerationJerkMagnitude-std()
-	TimeDomainBodyGyroMagnitude-std()
-	TimeDomainBodyGyroJerkMagnitude-std()
-	FrequencyDomainBodyAcceleration-std()-X
-	FrequencyDomainBodyAcceleration-std()-Y
-	FrequencyDomainBodyAcceleration-std()-Z
-	FrequencyDomainBodyAccelerationJerk-std()-X
-	FrequencyDomainBodyAccelerationJerk-std()-Y
-	FrequencyDomainBodyAccelerationJerk-std()-Z
-	FrequencyDomainBodyGyro-std()-X
-	FrequencyDomainBodyGyro-std()-Y
-	FrequencyDomainBodyGyro-std()-Z
-	FrequencyDomainBodyAccelerationMagnitude-std()
-	FrequencyDomainBodyAccelerationJerkMagnitude-std()
-	FrequencyDomainBodyGyroMagnitude-std()
-	FrequencyDomainBodyGyroJerkMagnitude-std()
