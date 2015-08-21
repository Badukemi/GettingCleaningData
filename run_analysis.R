setwd("C:/Users/Paul Askew/Coursera/GettingCleaningData")
library(dplyr)
#read all the data in
trainData <- read.table("./data/train/X_train.txt")
trainlabel <- read.table("./data/train/y_train.txt")
trainsub <- read.table("./data/train/subject_train.txt")
testsub <- read.table("./data/test/subject_test.txt")
testlabel <- read.table("./data/test/y_test.txt")
testData <- read.table("./data/test/X_test.txt")
features<-read.table("./data/features.txt")
activities<-read.table("./data/activity_labels.txt")
#tidy the column names up by making all lower case and removing hyphens
features$V2<-tolower(features$V2)
features$V2<-sub("-","",features$V2)
features$V2<-sub("()","",features$V2)
#Start to join the data together
combine_data<-rbind(trainData,testData)
combine_label<-rbind(trainlabel,testlabel)
combine_sub<-rbind(trainsub,testsub)
sel_col<-grep("mean|std",features$V2)
combine_data<-combine_data[,sel_col]
features<-features[sel_col,]
#make the activities textual
combine_label$V1<-factor(combine_label$V1,levels=activities$V1,labels=activities$V2)
#give the columns the appropriate names
colnames(combine_data)<-features[,2]
colnames(combine_label)<-"activity"
colnames(combine_sub)<-"subject"
#do the final combination into one big dataset adding the subject and activity to the end
dat<-cbind(combine_data,combine_sub,combine_label)
#now work out the mean per subject etc.

dat_mean<- dat %>% group_by(activity, subject) %>% summarise_each(funs(mean))
write.table(dat_mean,file="./data/tidyData.txt",sep=",",row.names = FALSE)

