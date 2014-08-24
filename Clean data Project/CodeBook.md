##tidy data CodeBook

###features
- sub: the subject who performed the activity
- labels:activity name

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- fBodyAccJerk-mean()-XYZ
- fBodyAccJerk-std()-XYZ
- fBodyAcc-mean()-XYZ
- fBodyAcc-std()-XYZ
- fBodyGyro-mean()-XYZ
- fBodyGyro-std()-XYZ
- tBodyAccJerk-mean()-XYZ
- tBodyAccJerk-std()-XYZ
- tBodyAcc-mean()-XYZ
- tBodyAcc-std()-XYZ
- tBodyGyroJerk-mean()-XYZ
- tBodyGyroJerk-std()-XYZ
- tBodyGyro-mean()-XYZ
- tBodyGyro-std()-XYZ
- tGravityAcc-mean()-XYZ
- tGravityAcc-std()-XYZ

The set of variables that were estimated from these signals are: 

	mean(): Mean value
	std(): Standard deviation

- fBodyAccMag-mean()
- fBodyAccMag-std()
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-std()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-std()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-std()
- tBodyAccJerkMag-mean()
- tBodyAccJerkMag-std()
- tBodyAccMag-mean()
- tBodyAccMag-std()
- tBodyGyroJerkMag-mean()
- tBodyGyroJerkMag-std()
- tBodyGyroMag-mean()
- tBodyGyroMag-std()
- tGravityAccMag-mean()
- tGravityAccMag-std()




##Get data
  read in the txt files data into R
##Clean data

1. cbind the subject data, labels data and the test/train data, and names the test/train data.
2. rbind the test and train data and return the mergedata.
3. Extract the mean and standard deviation feature columns,and save the new dataset ExtData.
4. melt the ExtData
5. dcast the molten data to count the mean of each variable for each activity for each subject.

