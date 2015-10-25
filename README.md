---
title: "ReadMe"
author: "Melanie Tansley"
date: "19 October 2015"
output: html_document
---

#Getting and Cleaning Data Course Project


Project of [Getting and Cleaning Data course on Coursera](https://www.coursera.org/course/getdata), October 2015.

## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

You will be required to submit:

1. a tidy data set as described below 
2. a link to a Github repository with your script for performing the analysis
3. a code book that describes the variables, the data, and any transformations or        work that you performed to clean up the data called CodeBook.md. 
4. You should also include a README.md in the repo with your scripts. 



A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here is the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## In this repository

1. CodeBook_GC_project.md: information about raw and tidy data set and elaboration made to
  transform them
2. readMe.md: this file
3. run_analysis.R: R script to transform raw data set in a tidy one
4. tidy_data_set.txt: end ouptut of the script

## Creating the tidy data set

1. clone this repository: `git clone git@github.com:maurotrb/getting-cleaning-data-2014-project.git`
2. download [compressed raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
3. unzip raw data and copy the directory `UCI HAR Dataset` to the cloned repository root directory
4. open a R console and set the working directory to the repository root (use setwd())
5. source run_analysis.R' script (it requires the plyr package): source ('run_analysis.R')

In the repository root directory you find the file `tidy_data_set.txt` with the tidy data set.

