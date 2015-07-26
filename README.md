# Getting-and-Cleaning-Data
Assignment for "Getting and Cleaning Data" course

Includes the run_analysis.R script to process the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The script will process the Human Activity Recognition Using Smartphones Data Set to produce a tidy data 
set containing average values for each variable from original data set per every activity and every subject.

As a prelimiminary step test and train data are merged to produce a subset with the measurements on the mean
and standard deviation for each measurement of the initial data set.

The variable names are processed to contain only lowercase letters and omit "." and "_" characters.
Course materials don`t say anything against using "-" in the names so I used it to improve readability.

The final tidy set is saved in file "finalset.txt" inside the initial dataset folder.

Initial data set can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
