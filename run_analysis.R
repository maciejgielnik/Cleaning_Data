################################################################################
## LIBRARIES USED IN THIS SCRIPT
################################################################################
library(data.table)
library(sqldf)
library(dplyr)



################################################################################
## LOADING FILES
################################################################################
## loading all train files
training_set <- read.table("./UCI HAR Dataset/train/X_train.txt")
training_labels <- read.table("./UCI HAR Dataset/train/y_train.txt")
training_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

##loading all test files
test_set <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

##loading features and activity labels
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")



################################################################################
##    1.  Merges the training and the test sets to create one data set.
################################################################################
#merging the training and the test sets to create one data set
merged_data_set <- rbind(training_set, test_set)

#removing non standard names in feature file
features$V2 <- gsub("\\()", "", features$V2)
features$V2 <- gsub("\\(", "", features$V2)
features$V2 <- gsub("\\)", "", features$V2)
features$V2 <- gsub("-", "", features$V2)
features$V2 <- gsub(",", "", features$V2)
features$V2 <- tolower(features$V2)

#changing column names in merged data set
names(merged_data_set) <- features$V2

#making valid column names for repeating column names
make_valid_names <- make.names(names = names(merged_data_set), unique=TRUE, allow_ = TRUE)
make_valid_names <- gsub("\\.", "v", make_valid_names)
names(merged_data_set) <- make_valid_names

merged_data_set

################################################################################
##    2. Extracts only the measurements on the mean and 
##       standard deviation for each measurement. 
################################################################################
#extracting columns with mean
columns_with_mean <- as.vector(grep("mean", make_valid_names))
extracted_columns_mean <- merged_data_set[, c(columns_with_mean)]

#extracting columns with std
columns_with_std <- as.vector(  grep("std", make_valid_names))
extracted_columns_std <- merged_data_set[, c(columns_with_std)]

#merging extracted columns with mean and std
merged_extracted_columns <- cbind(extracted_columns_mean, extracted_columns_std)
names(merged_extracted_columns)                                                           ###


################################################################################
##    3. Uses descriptive activity names to name the activities in the data set
################################################################################
#merging labels in same order as merging data set to have a proper order
merged_labels <- rbind(training_labels, test_labels)

#assigning activity to labels using SQL
activities <- sqldf("SELECT M.V1, A.V2 from merged_labels M LEFT JOIN activity_labels A ON A.V1 = M.V1")

#rename columns
names(activities) <- c("number", "activity")

#merge activities names with merged_extracted_columns
merged_extracted_columns <- cbind("activity" = activities$activity, merged_extracted_columns)

################################################################################
##    4. Appropriately labels the data set with descriptive variable names. 
################################################################################
#merge subjects in same order as merging data set to have a proper order
merged_subjects <- rbind(training_subject, test_subject)
names(merged_subjects) <- c("subject")

#merge subject labels with merged_extracted_columns
merged_data_set_subjects <- cbind(merged_subjects, merged_extracted_columns)



################################################################################
##    5. From the data set in step 4, creates a second, 
##       independent tidy data set with the average of each variable 
##       for each activity and each subject.
################################################################################
#merged_data_set_subjects filtered by ave of each variable for each activity and subject
tidy_ave_activity_subject <- merged_data_set_subjects %>% group_by(activity, subject) %>%  summarise_each( dplyr::funs(mean)) %>% ungroup()

#save
write.table(tidy_ave_activity_subject, "./tidy_data.txt", row.names = FALSE, col.names = TRUE)
#when you read tidy_data.txt with read.table make sure that header = TRUE that is read.table("./tidy_data.txt", header = TRUE)("./tidy_data.txt", header = TRUE)


