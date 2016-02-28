#    Download the Data
    download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', destfile='movement_data.zip', method='curl')
    unzip('movement_data.zip')

# 1. Merge test and training data sets

    #merge subject_test and subject_train into subject_merged
    subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')
    subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')
    subject_merged <- rbind(subject_train, subject_test)
    names(subject_merged) <- "subject"
    
    #merge x_test and x_train datasets into x_merged
    x_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
    x_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
    x_merged  <- rbind(x_train, x_test)

    #merge y_test and y_train datasets into y_merged
    y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
    y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
    y_merged  <- rbind(y_train, y_test)

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 

    features <- read.table('./UCI HAR Dataset/features.txt', header=FALSE, col.names=c('id', 'name'))
    feature_selected_columns <- grep('mean\\(\\)|std\\(\\)', features$name)
    X_filtered_dataset <- x_merged[, feature_selected_columns]
    names(X_filtered_dataset) <- features[features$id %in% feature_selected_columns, 2]

# 3. Uses descriptive activity names to name the activities in the data set

    activity_labels <- read.table('./UCI HAR Dataset/activity_labels.txt', header=FALSE, col.names=c('id', 'name'))

# 4. Appropriately labels the data set with descriptive activity names. 

    y_merged[, 1] = activity_labels[y_merged[, 1], 2]
    names(y_merged) <- "activity"

# 5.1) Creates an intermediate dataset with all required measurements.

    full_dataset <- cbind(subject_merged, y_merged, X_filtered_dataset)

# 5.2) Creates the independent tidy data set with the average of each variable for each activity and each subject.

    measurements <- full_dataset[, 3:dim(full_dataset)[2]]
    tidy_dataset <- aggregate(measurements, list(full_dataset$subject, full_dataset$activity), mean)
    names(tidy_dataset)[1:2] <- c('subject', 'activity')

# 5.3 Write the tidy dataset to a txt and csv file          
    dir.create('./output')
    write.csv(tidy_dataset, "./output/final_tidy_dataset.csv")
    write.table(tidy_dataset, "./output/final_tidy_dataset.txt")