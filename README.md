Getting-and-Cleaning-Data-Course-Project
========================================
Source of original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Unzip the data into a directory called "mydir"

The attached R script (run_analysis.R) performs the following to clean up the data:

1. Read in eight files: 
train/X_train.txt with test/X_test.txt -- contain 561 variables that represent 561 features
train/y_train.txt with test/y_test.txt -- contain activity IDs.
train/subject_train.txt with test/subject_test.txt -- contain subject IDs,
features.txt -- contains 561 features
activity_labels.txt -- contains activity IDs and names

2. Combine three datasets (x, y, subject) together for both train and test, merge them with features and activity_labels to get descriptive names for all the variables in the combined datasets

3. Merge two combined datasets (train and test) to create one dataset

4. Extracts only the measurements on the mean and standard deviation for each measurement in the merged dataset

5. Melt the extracted merged dataset by subject and activity and cast it back to the tidy_data format with function of mean; the output dataset is an independent tidy data set with the average of each variable for each activity and each subject.

6. Export the independent tidy dataset to a text file.
