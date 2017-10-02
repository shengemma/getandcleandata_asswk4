
##PT1:

##all the test files
fattest<-read.table("UCI HAR Dataset/test/X_test.txt")
str(fattest)
acttest<-read.table("UCI HAR Dataset/test/Y_test.txt")
str(acttest)
sjtest<-read.table("UCI HAR Dataset/test/subject_test.txt")
str(sjtest)
test<-data.frame(fattest,acttest,sjtest)

##all the train files
fattrain<-read.table("UCI HAR Dataset/train/X_train.txt")
str(fattrain)
acttrain<-read.table("UCI HAR Dataset/train/Y_train.txt")
str(acttrain)
sjtrain<-read.table("UCI HAR Dataset/train/subject_train.txt")
str(sjtrain)
train<-data.frame(fattrain,acttrain,sjtrain)


##combind test&train
fat<-rbind(fattest, fattrain)
act<-rbind(acttest, acttrain)
sj<-rbind(sjtest,sjtrain)
#data.all<-rbind(test,train)
#str(data.all)

##name the var.
names(sj)<-c("subject")
names(act)<-c("activity")
featurename<-read.table("UCI HAR Dataset/features.txt")
names(fat)<-featurename$V2

##get the data together
datafatact<-cbind(sj,act)
data<- cbind(fat,datafatact)


##PT2:
##Extracts only the measurements on the mean and standard deviation for each measurement.

ms<-featurename$V2[grep("mean\\(\\)|std\\(\\)", featurename$V2)]
#str(ms)
selfatnames<-c(as.character(ms),"subject","activity")
data<-subset(data, select=selfatnames)
str(data)

#x<-rbind(xtest,xtrain)
#data.sub<-data.all[,c(1,2,ms + 2)]


##PT3:
##Uses descriptive activity names to name the activities in the data set
ac <- read.table("UCI HAR Dataset/activity_labels.txt")
str(ac)
head(ac)
head(ac$V2)
head(data$activity)

##PT4
##Appropriately labels the data set with descriptive variable names


names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

names(data)



##PT5
##From the data set in step 4, creates a second, 
##independent tidy data set with the average of each variable for each activity 
##and each subject.

install.packages("plyr")
install.packages("data.table")
library(plyr)
data<-aggregate(.~subject+activity,data,mean)
data<-data[order(data$subject,data$activity),]
write.table(data,file = "tidydata.txt",row.name= F)



#data.tidy <- aggregate(data.sub[,3:81], by = list(activity = data.sub$activity, subject = data.sub$subject),FUN = mean)
#write.table(x = data.tidy, file = "data_tidy.txt", row.names = FALSE)
