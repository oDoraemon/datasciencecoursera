# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(reshape2)
readData<- function(wd="./UCI HAR Dataset"){
  if(!file.exists("activity_labels.txt")) ## in case the code is excuted twice or more
    setwd(wd)
  getActLabels<-function(){
    actLabels<-read.table("activity_labels.txt")  
  }
  getFeatures<-function(){
    features<-read.table("features.txt")  
  }
  ## test data
  getSubTest<-function(){
    subTest<-read.table("./test/subject_test.txt")  
  }
  getTestData<-function(){
    testData<-read.table("./test/X_test.txt")  
  }
  getYTest<-function(){
    yTest<-read.table("./test/y_test.txt")  
  }
  
  ## train data
  getSubTrain<-function(){
    subTrain<-read.table("./train/subject_train.txt")  
  }
  getTrainData<-function(){
    trainData<-read.table("./train/X_train.txt")  
  }
  getYTrain<-function(){
    yTrain<-read.table("./train/y_train.txt")  
  }
  list(getActLabels=getActLabels(),getFeatures=getFeatures(),
       getSubTest=getSubTest(),getTestData=getTestData(),getYTest=getYTest(),
       getSubTrain=getSubTrain(),getTrainData=getTrainData(),getYTrain=getYTrain())
}
## merge Test and Train data,return the named and merge data
mergeTT<-function(){
  readIn<-readData()
  actLabels<-readIn$getActLabels
  features<-readIn$getFeatures
  subTest<-readIn$getSubTest
  testData<-readIn$getTestData
  yTest<-readIn$getYTest
  
  subTrain<-readIn$getSubTrain
  trainData<-readIn$getTrainData
  yTrain<-readIn$getYTrain
  #lower the case and remove the dash
  feature2<-gsub("-","",tolower(as.character(features$V2)))
  test<-cbind(subTest,yTest,testData)
  names(test)<-c("sub","label",feature2)
  
  train<-cbind(subTrain,yTrain,trainData)
  names(train)<-c("sub","label",feature2)
  
  mergeData<-rbind(test,train)
  ## name the table with descriptive names
  mergeData$label<-as.character(sapply(mergeData$label,function(x) actLabels[actLabels$V1==x,2]))
  mergeData<-mergeData[order(mergeData$sub),]
  # assign the data as global for other functions to use
  assign("mergeData",mergeData,envir = .GlobalEnv)
}

## Extracts the needed columns, return the Extracted Dataset
getExtData<-function(){
  if (!exists("mergeData"))
    mergeData<-mergeTT()
  ExtFeatures<-names(mergeData)[c(grep("mean\\(\\)",names(mergeData)),grep("std\\(\\)",names(mergeData)))]
  ExtData<-mergeData[,c("sub","label",ExtFeatures)]
}
## create the new tidy data set
getNewset<-function(ExtData){
  if(!exists("Extdata"))
    ExtData<-getExtData()
  mdata<-melt(ExtData,id=1:2)
  tidyData<-dcast(mdata,sub+label~variable,mean)
  if(!file.exists("tidyData.txt"))
    write.table(tidyData,"tidyData.txt",row.name=F)
  tidyData
}