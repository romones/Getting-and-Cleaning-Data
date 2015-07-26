## The script will process the Human Activity Recognition Using Smartphones Data Set 
## to merge test and train data and produce a subset with the measurements on 
## the mean and standard deviation for each measurement of the initial data set.
## Will structure the subset according to the tidy data set criteria.

#Read general data
features <- read.table("features.txt", stringsAsFactors = FALSE)
activities <- read.table("activity_labels.txt", stringsAsFactors = FALSE, col.names = c("id","name"))
features <- read.table("features.txt", stringsAsFactors = FALSE,  col.names = c("id","name"))

#Read test related data
test_labels <- read.table("test/y_test.txt", stringsAsFactors = FALSE, col.names = c("activityid"))
test_set <- read.table("test/X_test.txt", stringsAsFactors = FALSE)
test_subjects <- read.table("test/subject_test.txt", stringsAsFactors = FALSE, col.names = "subjectid")

#Read train related data
train_labels <- read.table("train/y_train.txt", stringsAsFactors = FALSE, col.names = c("activityid"))
train_set <- read.table("train/X_train.txt", stringsAsFactors = FALSE)
train_subjects <- read.table("train/subject_train.txt", stringsAsFactors = FALSE, col.names = "subjectid")

#Merge sets
merged_labels <- rbind(test_labels,train_labels)
merged_set <- rbind(test_set,train_set)
merged_subjects <- rbind(test_subjects,train_subjects)

rm(list = ls()[grep("^(test|train).*$", ls(), perl = TRUE)]) #Clean  workspace from some heavy data

# Process the variable names according to tidy rules
activities$name <- gsub("[[:punct:]]","",activities$name) # Remove the punctuation characters
activities$name <- tolower(activities$name)

activityname <- merge(merged_labels,activities, by=1)[,2] # Make meaningfull activity names

names(merged_set) <- features$name

selectnames <- grep ("-mean\\(\\)|-std\\(\\)", features$name) # Get the columns of interest to be used with subsetting later 

names(merged_set) <- make.names(names = names(merged_set), unique = TRUE, allow_ = TRUE)


merged_subset <- select(merged_set, selectnames)

names(merged_subset) <- gsub("[[:punct:]]","",names(merged_subset)) # Remove any punctuation characters
names(merged_subset) <- gsub("([[:upper:]])","-\\1",names(merged_subset)) # Add dashes for readability
names(merged_subset) <- tolower(names(merged_subset))

# Finally pack the final set
merged_set_full <- cbind(merged_subjects,activityname,merged_subset)

write.table(merged_set_full,"finalset.txt",row.names = FALSE)

# Clean the workspace
rm(list = ls())