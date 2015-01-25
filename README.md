# GettingAndCleaningData
Project of Coursera course: Getting and Cleaning data
=====================================================

This repository has project work of Coursera course Getting and Cleaning data


UCI HAR Dataset is in zip file and at first it have to extract.
There was 3 files (features, activity labels and subjects) for test and training.


At first run_analysis.R script merge training and test sets together
Next step is to find out and choose only columns with means or standard deviations. 
And names for those columns from features file.
Then the script adds Activities and merge all together


Last step of the script crate a tidy data (avg_file.txt) where are means of all columns per test subject and per activity
