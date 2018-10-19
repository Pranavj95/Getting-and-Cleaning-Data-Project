#README for analysis done for tidydata.txt file

##Steps to get the tidy data output as defined by the project objective
*Create a folder and download the file in it
*unzip the file and read the desired files as variables
*Combine test and train data sets
*rename col names wherever necessary
*combine subject and activity columns to the combinedfeatures dataset
*filter out mean and std columns
*replace activity names 
*improve column names by replacing "t" and "f" with time and frequency
*to make a tidy data set, use the reshape2 package
*meltdata by subject and activity as ids
*dcast the variables with respect to ids and take the mean of all the values
*arrange the dataset by subject and activity
*Write the datatable to tidydata.txt file

