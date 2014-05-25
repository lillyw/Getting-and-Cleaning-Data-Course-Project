##### Merges the training and the test sets to create one dataset and appropriately labels the dataset.

# read the test and train datasets

mydir<-"U:/myR/Rtraining2/UCI HAR Dataset"
x_test<-read.table(paste(mydir, "/test/X_test.txt", sep=""))
y_test<-read.table(paste(mydir, "/test/y_test.txt", sep=""))
s_test<-read.table(paste(mydir, "/test/subject_test.txt", sep=""))

x_train<-read.table(paste(mydir, "/train/X_train.txt", sep=""))
y_train<-read.table(paste(mydir, "/train/y_train.txt", sep=""))
s_train<-read.table(paste(mydir, "/train/subject_train.txt", sep=""))

# read the activity labels and feature

actlabel<-read.table(paste(mydir, "/activity_labels.txt", sep=""))
feature<-read.table(paste(mydir, "/features.txt", sep=""))


# merge test datasets together and add column names
y_test_actlabel<-merge(y_test, actlabel, by="V1") # merge y_test with activity labels
names(y_test_actlabel)<-c("Activity_id", "Activity") # name y label
names(s_test)<-"Subject"
names(x_test)<- as.vector(feature[,2])
ds_test<-cbind(s_test, y_test_actlabel, x_test)

# merge training datasets together and add column names
y_train_actlabel<-merge(y_train, actlabel, by="V1") # merge y_train with activity labels
names(y_train_actlabel)<-c("Activity_id", "Activity") # name y label
names(s_train)<-"Subject" 
names(x_train)<-as.vector(feature[,2])
ds_train<-cbind(s_train, y_train_actlabel, x_train)

# merge test and train dataset
ds_all<-rbind(ds_test, ds_train)


###### Extracts only the measurements on the mean and standard deviation for each measurement. 

meancol<-grep("mean()", colnames(ds_all), fixed=TRUE)
stdcol<-grep("std()", colnames(ds_all), fixed=TRUE)
mycol<- c(meancol, stdcol)
mycol<-sort(mycol)

sub_ds_all<-ds_all[, c(1,2,3, mycol)]


##### Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Melt the dataset

library(reshape2)
mds<-melt(sub_ds_all, id=c("Subject", "Activity_id", "Activity"))

# Cast the melted data
tidyds<-dcast(mds, formula=Subject + Activity_id + Activity ~ variable, mean)

# export the tidy dataset to a txt file
write.table(tidyds, paste(mydir, "/tidyds.txt", sep=""), sep="\t", row.names=FALSE)
