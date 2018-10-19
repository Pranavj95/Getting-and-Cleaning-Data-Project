# Codebook
The codebook is regarding the Getting and Cleaning Data project. It will give you an idea of the analysis that was done using various variables and observations found in different files.

The data is a part of the experiment done on 30 volunteers and various parameters were noted while wearing the Samsung watch as they performed various activities
Data has been divided into test and train. Train constitutes 70% of the overall data.

## Files that were used:
* features.txt: It provided the various vaiables used in the experiment
* activity_lables.txt: Gives the activities that are done
* X_test.txt: Gives observations for test data
* Y_test.txt: Gives the feature list for test data
* subject_test.txt: Volunteer number for test data
* X_train.txt: Gives observations for train datatrain
* Y_train.txt: Gives the feature list for train data
* subject_train.txt: Volunteer number for train data

## Steps followed in brief:
1. Downloaded the zipfile and extracted to a folder
2. Read the necessary files to various datasets
3. Filtered out the mean and std features
4. converted the data into tidy data with mean of each subject and activity
5. wrote the final data into a tidy text file

