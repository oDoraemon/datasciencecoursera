* Note
* Clean data
* Description
* Example
##Note
* make sure the library {reshape2} have been installed
* the zip data files should be unzipped to your working directory, so there should be a "UCI HAR Dataset" right in the working directory

##Clean data
1. cbind the subject data, labels data and the test/train data, and names the test/train data.
2. rbind the test and train data and return the mergedata.
3. Extract the mean and standard deviation feature columns,and save the new dataset ExtData.
4. melt the ExtData
5. dcast the molten data to count the mean of each variable for each activity for each subject.

##Description
source the run_analysis.R file and it will return 4 functions:

* **readData()**: return a list of get method.
* **mergeTT()**: return a global data.frame *mergeData*,which is the merge of train data and test data. For it takes a very long time to read in data, set the *mergeData* as global to make it easier with debuging and reuse. *mergeData* is well named,as the "sub" stands for subject, "labels" stands for activity name, and the rest are features. It's sorted by subject.
* **getExtData()**: return the extracted data which contains only the mean and standard deviation of each measurement.If the *mergeTT()* havn't been called, this function will call it ,and create the *mergeData*.In this case, it will takes a long long time.
* **getNewset()**: 1.return the tidy dataset with the mean of each variable for each activity and each subject;2.create a "tidyData.txt" in the working directory.If the global *mergeData* havn't been created, it will also read in the data, and this takes a very long time.

##Example
	>mergeTT()
	>extData<-getExtData()
	>tidyData<-getNewset()

