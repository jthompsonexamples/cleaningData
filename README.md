# cleaningData

The run_analysis.R script is the only script in the repository.

It fetches the data from the web and extracts the data into
the working directory.

The script then reads in the activity data and uses a join to change the
number values to meaningful text values.

Then the test and training data is read in using read_delim, parsed as text,
and cleaned by triming the whitespace in the data. Then the data were converted
into numeric data and checked for NA values.

Next the number of rows in the activity data and the main data for the test and
training set were compared to ensure correct sizes. After all data was verified
the activities were bound to the main data sets and then the data were bound into
a complete data set.

The data were subset using regular expressions to only get the mean, sd, and meanFreq
measurements and the names cleaned up by removing dashes.

Finally I calculated the mean of each feature using group_by and summarize.
