# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course Project

This repo contains three files:
- run_analyis.R (R script performing an analysis)
- CodeBook.md (document explaining all used variables, data and transformations)
- README.md (this file, explaining the algorithm used by the R script)

The R script performs five functions:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

It does so, by first reading in all relevant data files:
UCI HAR Dataset/train/subject_train.txt
UCI HAR Dataset/train/X_train.txt
UCI HAR Dataset/train/y_train.txt
UCI HAR Dataset/test/subject_test.txt
UCI HAR Dataset/test/X_test.txt
UCI HAR Dataset/test/y_test.txt
UCI HAR Dataset/features.txt
UCI HAR Dataset/activity_labels.txt

Then it assigns the variable names located in the 'features' file to the column names of X_train and X_test, thus fulfilling function 4.

Next it adds extra variables to the main data.frames:
- subject_train to X_train and subject_test to X_test (containing the Subject info)
- y_train to X_train and y_test to X_test (containing the activity info)

Finally it merges the data.frames X_train and X_test to one data.frame called X_total,
thus fulfilling function 1.

It then finds all variables containing either the string "mean" or "std" and creates a new data.frame 'X_subtotal' containing only these variables plus the 'Subject' and 'Activity' variable,
thus fulfilling function 2.

To fulfill function 3, it transforms the variable 'Activity' from integer to factor using 'activity_labels' as labels.

Function 4 was already fulfilled.

Function 5 is fulfilled by first melting the 'X_subtotal' to a data.frame 'X_melt' with four variables: Subject, Activity, Measurement, Value. Then it uses dcast to create a new data.frame 'X_sec' with the average of each variable for each activity for each subject.


