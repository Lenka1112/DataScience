testData <- read.table("./UCI_HAR_Dataset/test/X_test.txt")
feature_labels <- read.table("./UCI_HAR_Dataset/features.txt")
colnames(testData) <- feature_labels[, 2]
y_test <- read.table("./UCI_HAR_Dataset/test/y_test.txt")
activity_labels <- read.table("./UCI_HAR_Dataset/activity_labels.txt")
activity_frame <- merge(y_test, activity_labels, by.x="V1", by.y="V1", sort = FALSE)
testData <- cbind(activity_frame$V2, testData)
colnames(testData)[1] <- "activity"
subject_test <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")
testData <- cbind(subject_test$V1, testData)
colnames(testData)[1] <- "subject"
trainData <-read.table("./UCI_HAR_Dataset/train/X_train.txt")
colnames(trainData) <- feature_labels[, 2]
y_train <- read.table("./UCI_HAR_Dataset/train/y_train.txt")
activity_frame <- merge(y_train, activity_labels, by.x="V1", by.y="V1", sort = FALSE)
trainData <- cbind(activity_frame$V2, trainData)
colnames(trainData)[1] <- "activity"
subject_train <- read.table("./UCI_HAR_Dataset/train/subject_train.txt")
trainData <- cbind(subject_train$V1, trainData)
colnames(trainData)[1] <- "subject"
combinedData <- rbind(testData, trainData)
valid_columns_mean <- grep("mean()", names(combinedData))
valid_columns_std <- grep("std()", names(combinedData))
valid_columns <- c(valid_columns_mean, valid_columns_std)
valid_columns <- sort(valid_columns)
valid_columns <- c(1, 2, valid_columns)
filteredData <- combinedData[, valid_columns]
summary_groups <- group_by(filteredData, activity, subject)
summaryData <- summarise_each(summary_groups, funs(mean))
summaryData <- arrange(summaryData, subject)