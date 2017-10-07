##PT1:

##all the test files
x_test<-read.table("UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("UCI HAR Dataset/test/Y_test.txt")
sj_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
test<-cbind(sj_test,y_test,x_test)

##all the train files
x_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("UCI HAR Dataset/train/Y_train.txt")
sj_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
train<-cbind(x_train,y_train,sj_train)

features<-read.table("UCI HAR Dataset/features.txt")
activity<-read.table("UCI HAR Dataset/features.txt")

##PT2:
##Extracts only the measurements on the mean and standard deviation for each measurement.

##combind test&train
x<-rbind(x_train, x_test)
y<-rbind(y_train, y_test) 
sj<-rbind(sj_train,sj_test)

ms<-grep("mean\\(\\)|std\\(\\)", features[,2])

x<-x[, ms]

names(sj)<-"subject"
names(x)<-features[ms,2]


##PT3:
##Uses descriptive activity names to name the activities in the data set
y[,1]<-activity[y[,1],2]
names(y)<-"activity"

##PT4
##Appropriately labels the data set with descriptive variable names

Data<-cbind(x,y,sj)

names(Data)<-gsub("std()", "SD", names(Data))
names(Data)<-gsub("mean()", "MEAN", names(Data))
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

names(Data)

##PT5
##From the data set in step 4, creates a second, 
##independent tidy data set with the average of each variable for each activity 
##and each subject.

install.packages("plyr")
#install.packages("data.table")

library(plyr)
avg<- ddply(Data,.(subject,activity), function(x) colMeans(x[, 1:66]))
write.table(avg,"tide_data_V2.txt", row.name = FALSE)




