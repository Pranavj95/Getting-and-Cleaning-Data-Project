## load packages

library(dplyr)

##Create a folder and download the file in it

if(!file.exists("./data")){
  dir.create("./data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/dataset.zip")

## unzip the file and read the desired files as variables

unzip(zipfile = "./data/dataset.zip", exdir = "./data")
pth <- file.path("./data", "UCI HAR Dataset")
testfeatures <- read.table(file.path(pth, "test", "X_test.txt"))
testsub <- read.table(file.path(pth, "test", "subject_test.txt"))
testactivity <- read.table(file.path(pth, "test", "Y_test.txt"))
trainfeatures <- read.table(file.path(pth, "train", "X_train.txt"))
trainsub <- read.table(file.path(pth, "train", "subject_train.txt"))
trainactivity <- read.table(file.path(pth, "train", "Y_train.txt"))
featurenames <- read.table(file.path(pth, "features.txt"))
activitynames <- read.table(file.path(pth, "activity_labels.txt"))
## Combine test and train data sets

combinedfeatures <- rbind(testfeatures, trainfeatures)
combinedsub <- rbind(testsub, trainsub)
combinedactivity <- rbind(testactivity, trainactivity)

## rename col names wherever necessary
colnames(combinedfeatures) <- as.character(featurenames$V2)
colnames(combinedsub) <- c("subject")
colnames(combinedactivity) <- c("activity")

## combine subject and activity columns to the combinedfeatures dataset
combineddata <- cbind(combinedsub, combinedactivity, combinedfeatures)

## filter out mean and std columns
desiredcol <- featurenames$V2[grep("mean\\(\\)|std\\(\\)", featurenames$V2)]
finalcol <- c("subject", "activity", as.character(desiredcol))
finaldata <- subset(combineddata, select = finalcol)

##replace activity names
finaldata$activity <- as.factor(finaldata$activity)
levels(finaldata$activity) <- as.character(tolower(activitynames$V2))

##improve column names by replacing "t" and "f" with time and frequency
names(finaldata) <- gsub("^t", "time", names(finaldata))
names(finaldata) <- gsub("^f", "frequency", names(finaldata))

##to make a tidy data set
library(reshape2)
meltdata <- melt(finaldata, id = c("subject", "activity"), measure = names(finaldata)[3:68])
tidydata <- dcast(meltdata, subject+activity~variable, mean)
tidydata <- arrange(tidydata, subject, desc(activity))
write.table(tidydata, file = "tidydata.txt", row.names = FALSE, quote = FALSE)

## making a codebook
