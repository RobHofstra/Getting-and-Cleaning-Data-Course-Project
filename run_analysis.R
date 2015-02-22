## read all releveant data files
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
features<-read.table("UCI HAR Dataset/features.txt")
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")

## assign names to the variables of X_train and X_test
names(X_train)<-features[,"V2"]
names(X_test)<-features[,"V2"]

## add variable for subject to X_train and X_test
X_train$Subject<-subject_train$V1
X_test$Subject<-subject_test$V1

## add variable for activity
X_train$Activity<-y_train$V1
X_test$Activity<-y_test$V1

## merge training and test set and order on the subject variable
X_total<-rbind(X_train,X_test)
X_total<-X_total[order(X_total$Subject),]

## select only variable with names "mean" and "std" in it
X_subtotal<-X_total[,grepl("mean|std",features$V2)]

## turn activity variable into factor with descriptive activity names
X_subtotal$Activity<-factor(X_subtotal$Activity,labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

## make a vector with all variable names excluding 'Subject' and 'Activity'
vars<-colnames(X_subtotal)
vars<-vars[1:(length(vars)-2)]

## perform melt
library(reshape2)
X_melt<-melt(X_subtotal,id=c("Subject","Activity"),measure.vars=c(vars))

## create a second, independent tidy data set with the average of each variable for each activity and each subject
X_sec<-dcast(X_melt, Subject + Activity ~ variable,mean)

## save the just created dataset
write.table(X_sec,file="X_sec.txt",row.name=FALSE)
