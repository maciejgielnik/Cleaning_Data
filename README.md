This is a README for run_analysis.R script. The script was prepared for Course Project - Coursera Getting and Cleaning Data, it is written by Maciej Gielnik.

The Project was performed on:
Linux Ubuntu 16.04.1 
R version 3.6.3
RStudio Version 1.3.959

In the Project I have used the following packages:
sqldf - 0.4.11
dplyr - 1.0.1
data.table - 1.13.0 ## OPTIONAL - see below

Package choice justification:
data.table - reduces time of reading files. On my Laptop it reduced reading time from ~5 seconds to ~3 seconds. Not a lot, but still something.
sqldf - allows to use SQL joins and as a result less code is needed. I recommend a course on Coursera - SQL for Data Science offered by University of California, Davis. SQL really helps with merging tables or joining values.
dplyr - a package for working with data frames extensively  discussed during course

GETTING STARTED
1. Download run_analysis.R script and place it in working directory.
2. Download the data for project (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.) and place it in working directory 
3. Decompress the *.zip file.
4. Run the run_analysis.R script in RStudio.
NOTE: UCI HAR Dataset and run_analysis.R should be in the same directory.

READING tidy_data.txt
In order to read tidy_data.txt in a proper format make shure that you use header = TRUE.
read.table("./tidy_data.txt", header = TRUE)

HOW DOES IT WORK?
I have extensively commented the code in run_analysis.R script. Here is the framework:
1. Read three files from train set: X_train.txt, y_train.txt, subject_train.txt.
2. Read three files from test set: X_test.txt, y_test.txt, subject_test.txt.
3. Read files with labels for features and activity: features.txt, activity_labels.txt.
4. Merge the training and the test sets to create one data set.
5. Remove non standard names in feature file.
6. Change column names in merged data set to a new ones from point 5.
7. Make valid column names for repeating column names from point 6.
8. Extracts columns with mean.
9. Extracts columns with std.
10. Merge columns from point 8 and 9.
11. Create data frame with merged activity labels.
12. Using SQL writes full names to activities.
13. Merge activities names with data from point 10.
14. Create data frame with merged subjects.
15. Merge subjects with data from point 13.
16. Group data from point 15 by activity, subject.
17. Calculate mean of each variable for each activity and subject.
18. Save dataframe as tidy_data.txt.












