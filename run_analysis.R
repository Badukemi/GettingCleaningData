setwd("C:/Users/Paul Askew/Coursera/GettingCleaningData")
#read all the data in
trainData <- read.table("./data/train/X_train.txt")
trainlabel <- read.table("./data/train/y_train.txt")
trainsub <- read.table("./data/train/subject_train.txt")
testsub <- read.table("./data/test/subject_test.txt")
testlabel <- read.table("./data/test/y_test.txt")
testData <- read.table("./data/test/X_test.txt")
features<-read.table("./data/features.txt")
activities<-read.table("./data/activity_labels.txt")
#Start to join the data together
combine_data<-rbind(trainData,testData)
combine_label<-rbind(trainlabel,testlabel)
combine_sub<-rbind(trainsub,testsub)
#make the activities textual
combine_label$V1<-factor(combine_label$V1,levels=activities$V1,labels=activities$V2)
#give the columns the appropriate names
colnames(combine_data)<-features[,2]
colnames(combine_label)<-"Activity"
colnames(combine_sub)<-"Subject"
#rename the activities to something meaningful

#do the final combination into one big dataset adding the subject and activity to the end
dat<-cbind(combine_data,combine_sub,combine_label)

#write.table(tidyData,file="tidyData.txt",sep=",",row.names = FALSE)

