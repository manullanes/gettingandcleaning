##Getting and Cleaning Data Project
=================================
# Script run_analysis.R
The script is divide in the following steps:

- 1.Setting of the working directory.
- 2.Reading of the features labels (only mean and standard deviation). Values are saved in the data frame **features**.
- 3.Reading of the activity labels. Values are saved in the data frame **activity**.
- 4.Setting of the test example directory.
- 5.Reading of the subject test for the selected features. Values are saved in the data frame **subject_test**.
- 6.Reading of the test examples for the selected features. Values are saved in the data frame **X_test**.
- 7.Reading of the activity test labels for the selected features. Character values are saved in the factor **features**.
- 8.Mergin of subject_test and X_test data frames. The result data frame is named **test**.
- 9.We repeat the points 4,5,6,7 and 8 for the train examples.
- 10.Data frames asociated with the train examples are **subjects_train** and **X_train**.
- 11.The merged data frame of the train examples is called **train**.
- 12.Merging of **test** and **train** data frames.
- 13.Reshaping of the complete data using melt and dcast comands.The data frame **finalData** is obtained.
- 14.Writting of the tidydata.text in the folder of the project.

Variables are shown in **bold**

#CODE BOOK
id_subject-> Each row identifies the subject who performed the activity for each window sample.

features-> labels with their activity name.
   WALKING, WALKING UPSTAIR, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
   
The mean and the standard deviation of the following variables:
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag
