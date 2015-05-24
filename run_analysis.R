##loading dplry package to use select and such
library(dplyr)

##reading in data files
##train files
subject_train <- read.table("./train/subject_train.txt", header=F)
x_train <- read.table("./train/X_train.txt", header=F, stringsAsFactors=T)
y_train <- read.table("./train/y_train.txt", header=F)
##test files
subject_test <- read.table("./test/subject_test.txt", header=F)
x_test <- read.table("./test/x_test.txt", header=F, stringsAsFactors=T)
y_test <- read.table("./test/y_test.txt", header=F)

##creating headers and label substitute files
##reading in features file to get headers for x_train and x_test
features <- read.table("./features.txt", header=F)
##extracting header names, which is column 2, then transposing it so can add as header
xnames <- t(features[2])
##removing punctuation from names
xnames <- gsub("[[:punct:]]", "", xnames)
##changing "BodyBody" in labels to just "Body"
xnames <- gsub("BodyBody", "Body", xnames)
##adding headers to x_test and x_train
names(x_test) <- xnames
names(x_train) <- xnames

##reading in activity_labels file to get descriptive data for activity
activity_labels <- read.table("./activity_labels.txt", header=F)
##adding headers to y_test and y_train, which is the activity performed by subjects
names(y_test) <- c("activity")
names(y_train) <- c("activity")
##substituting descriptive text for numbers
y_train$activity <- activity_labels[,2][y_train$activity]
y_test$activity <- activity_labels[,2][y_test$activity]

##adding headers to subject_test and subject_train, which is id number
names(subject_test) <- c("id")
names(subject_train) <- c("id")

##selecting needed columns from larger data sets
##removing un-needed duplicated columns 
col_no_select <- c(303:344, 382:423, 461:502)
##unique column data sets
x_test <- x_test[, -(col_no_select)]
x_train <- x_train[, -(col_no_select)]
##adding id and activity columns
x_train <- cbind(subject_train, y_train, x_train)
x_test <- cbind(subject_test, y_test, x_test)

##creating working data sets
x_train <- select(x_train, id, activity, contains("mean"), contains("std"))
x_test <- select(x_test, id, activity, contains("mean"), contains("std"))
merge_train_test <- bind_rows(x_train, x_test)

##creating final table for part 5 of assignment
final <- merge_train_test %>% group_by(id, activity) %>% summarise_each(funs(mean))
write.table(final, "./final_table.txt", row.name=F, sep="\t")