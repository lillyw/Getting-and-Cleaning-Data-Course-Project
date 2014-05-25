Getting-and-Cleaning-Data-Course-Project
========================================
Source of original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

1. Unzip the data to your local computer, it will create a directory called "UCI HAR Dataset".

2. Save run_analysis.R to "UCI HAR Dataset" directory and set it as working directory.

3. Run source("run_analysis.R"), it will read eight files in "UCI HAR Dataset" directory and its "train" and "test" subdirectory and write one tidy data set.

Input datasets:

train/X_train.txt with test/X_test.txt -- contain 561 variables that represent 561 features.

train/y_train.txt with test/y_test.txt -- contain activity IDs.

train/subject_train.txt with test/subject_test.txt -- contain subject IDs.

features.txt -- contains 561 features.

activity_labels.txt -- contains 6 activity IDs and names.

Output dataset: 

tids.txt - contains the average of mean and standard deviation variables for each activity and each subject. 





