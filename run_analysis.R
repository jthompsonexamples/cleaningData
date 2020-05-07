###############################
## Justin Thompson           ##
## Army Logistics University ##
## 07May2020                 ##
###############################

require(tidyverse)

# Get the data
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileUrl, destfile='data.zip')
unzip('data.zip')

# Look at the file information
list.files(recursive=T)

# inspect a file to get delimiter info
read_lines('./UCI HAR Dataset/train/X_train.txt', n_max=5)

# read in the column names from the features file
colNames <- read_lines('./UCI HAR Dataset/features.txt')

# get the activities
activityLabel <- read_delim('./UCI HAR Dataset/activity_labels.txt', delim=' ',
                            col_names=c('num','Activity'))
trainActivityNumber <- read_table('./UCI HAR Dataset/train/y_train.txt', col_names = 'num')
trainActivity <- right_join(activityLabel, trainActivityNumber)

# get the training data, had to trim ws to fix a parse error
trainDF <- read_delim('./UCI HAR Dataset/train/X_train.txt', delim = ' ',
                      col_names=FALSE, trim_ws=TRUE)
# getting a parse error, need to fix by increasing the guess level and
# inspecting an error value

# check to make sure no parse errors
table(is.na(trainDF))
table(is.na(trainActivity$Activity))
# everything is numeric
# add the col names
names(trainDF) <- colNames

# is activity length the same as train set?
nrow(trainActivity)==nrow(trainDF)
# put them together
trainDF <- trainActivity %>% transmute(Activity) %>% bind_cols(trainDF)

## Do the test set
# get the activities
testActivityNumber <- read_table('./UCI HAR Dataset/test/y_test.txt', col_names = 'num')

testActivity <- right_join(activityLabel, testActivityNumber)

# get the training data, had to trim ws to fix a parse error
testDF <- read_delim('./UCI HAR Dataset/test/X_test.txt', delim = ' ',
                      col_names=FALSE, trim_ws=TRUE)
# getting a parse error, need to fix by increasing the guess level and
# inspecting an error value

# check to make sure no parse errors
table(is.na(testDF))
table(is.na(testActivityNumber))
# everything is numeric
# add the col names
names(testDF) <- colNames

# is activity length the same as train set?
nrow(testActivityNumber)==nrow(testDF)
# put them together
testDF <- testActivity %>% transmute(Activity) %>% bind_cols(testDF)

## put both datasets together

fullDF <- bind_rows(trainDF, testDF)

# get the mean and sd only
n <- names(fullDF)
tt <- grepl('mean|std|Activity', names(fullDF))
n <- n[tt]
# clear the numbers
n <- gsub('[0-9]+ ', '', n)
# clear the ()
n <- gsub('[()]', '', n)
# replace t with time, f with freq
n[grepl('tB|tG', n)] <- paste0('Time', str_sub(n[grepl('tB|tG', n)],2,-1))
n[grepl('fB|fG', n)] <- paste0('Freq', str_sub(n[grepl('fB|fG', n)],2,-1))
# clear out the dashes
n <- gsub('-', '', n)
subDF <- fullDF[,tt]
names(subDF) <- n

dataTidy <- gather(subDF, key='Feature', value = 'normalizedMeasurement')
