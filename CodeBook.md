# Getting-and-Cleaning-Data-Course-Project
CodeBook for run_analysis.R

###Variables used
Variable            Type        Value
- subject_train     Data.Frame  "UCI HAR Dataset/train/subject_train.txt"
- X_train           Data.Frame  "UCI HAR Dataset/train/X_train.txt"
- y_train           Data.Frame  "UCI HAR Dataset/train/y_train.txt"
- subject_test      Data.Frame  "UCI HAR Dataset/test/subject_test.txt"
- X_test            Data.Frame  "UCI HAR Dataset/test/X_test.txt"
- y_test            Data.Frame  "UCI HAR Dataset/test/y_test.txt"
- features          Data.Frame  "UCI HAR Dataset/features.txt"
- activity_labels   Data.Frame  "UCI HAR Dataset/activity_labels.txt"

- X_total           Data.Frame  merged set of X_train and X_test
- X_subtotal        Data.Frame  subset of X_total with only measurements containing either "mean" or "std"
- X_sec             Data.Frame  second independent tidy data set with the average of each variable for each activity and each subject.
- vars              vector      list of all measurement variables containing either "mean" or "std"

###Function used (not contained in base)
Function            Library
- melt              reshape2
- dcast             reshape2