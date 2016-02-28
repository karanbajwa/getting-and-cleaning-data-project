# Getting and Cleaning Data Project
This repo contains the analysis code and output tidy data files for assignment in Getting and Cleaning Data Course

## Walkthrough of run_analysis.R

This is a fully automated self contained, R script which downloads the original data, performs the required analysis, and outputs the tidy data files.  

This R script performs the steps below as required by the assignment:

1. Downloads the original dataset and stores it in the directory called `UCI HAR Dataset`
2. Reads and Merges the training and the test datasets into one.
3. Keeps the mean and standard deviation columns for each measurement. 
4. Using the activity lookup in source data, labels the data set with descriptive activity names. 
5. Generates a result tidy data set with the average of each variable for each activity and each subject. 
6. Creates an `output` directory
7. Saves the `tidy_dataset` as `final_tidy_dataset.csv` and `final_tidy_dataset.txt` files in the `output` directory.

## Run The Analysis

1. Running from command prompt
   `$> rscript run_analysis.R`
   
2. Running from R-Studio
  - Open the `run_analysis.R` file in R-Studio
  - Set the working directory to this file
  - Source all the code.

3. Checking the Result
Upon running, the `run_analysis.R` will generate the following files in the `output` directory.
  
  - `final_tidy_dataset.txt` : Contains the result tidy dataset
  - `final_tidy_dataset.txt` : Same result dataset published as CSV. This file when viewed in github, shows in a nice table. 
