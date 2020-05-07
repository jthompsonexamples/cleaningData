Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope
3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix time)
were captured at a constant rate of 50 Hz. Then they were filtered to remove noise.

Similarly, the acceleration signal was then separated into body and gravity
acceleration signals (TimeBodyAcc-XYZ and TimeGravityAcc-XYZ).

Subsequently, the body linear acceleration and angular velocity were derived in time
to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude 
of these three-dimensional signals were calculated using the Euclidean norm
(TimeBodyAccMag, TimeGravityAccMag, TimeBodyAccJerkMag, TimeBodyGyroMag, TimeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing
FreqBodyAcc-XYZ, FreqBodyAccJerk-XYZ, FreqBodyGyro-XYZ, FreqBodyAccJerkMag,
FreqBodyGyroMag, FreqBodyGyroJerkMag. (Freq indicates frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value of the measurements
std(): Standard deviation of the measurements
meanFreq(): Weighted average of the frequency components to obtain a mean frequency