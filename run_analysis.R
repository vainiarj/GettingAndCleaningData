setwd("./R/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")
library(plyr)
# 1. Merge the training and the test sets to create one data set

training_x_file <- read.table("train/X_train.txt")
training_y_file <- read.table("train/y_train.txt")
training_subject_file <- read.table("train/subject_train.txt")

test_x_file <- read.table("test/X_test.txt")
test_y_file <- read.table("test/y_test.txt")
test_subject_file <- read.table("test/subject_test.txt")

x_file <- rbind(training_x_file,test_x_file)
y_file <- rbind(training_y_file,test_y_file)
subject_file <- rbind(training_subject_file,test_subject_file)


# 2. Extracts only the measurements on the means and standard deviation for each measurement

features<- read.table("features.txt")

# 2.1 choose columns where names has mean or std

means_and_stds <- grep("-(mean|std)\\(\\)",features[,2])
x_file <- x_file[,means_and_stds]

# 2.2 new names for columns

names(x_file) <- features[means_and_stds,2]

# 3. Uses descriptive activity names to name the activities in the data set

activities<- read.table("activity_labels.txt")

# 3.1 activities to column and write column name for it
y_file[,1] <- activities[y_file[,1],2]
names(y_file) <- "activity"

# 4. Appropriately labels the data set with descriptive variable names

# 4.1 column name for subjects
names(subject_file) <- "subject"
 
# 4.2 all 3 files together
all <- cbind(x_file,y_file,subject_file)

# 5. From the data set in step 4. creates a second, indemendent tidy data set with 
#    the average of each variable for each activity and each subject

avg_file <- aggregate(all[,1:(ncol(all)-2)],by=list(Subject=all$subject, Activity=all$activity),FUN=mean)
avg_file <- avg_file[order(avg_file$Subject),]

write.table(avg_file, file="avg_file.txt", sep="\t",row.names=FALSE)
