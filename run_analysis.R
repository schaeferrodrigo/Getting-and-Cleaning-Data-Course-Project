# run_analysis.R


#creating a data folder
if(!exists("./data")){dir.create(("./data"))}


# Download files
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url , destfile = "./data/data_set.zip")
data_version <- date()


#unzip files
library(utils)
unzip("./data/data_set.zip", exdir = "./data")

# Reading data sets

data_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt",na.strings = "Not Available", stringsAsFactors = FALSE) # data set - TEST
act_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt",na.strings = "Not Available", stringsAsFactors = FALSE) # activity

data_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt",na.strings = "Not Available", stringsAsFactors = FALSE) # data set -TRAIN
act_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt",na.strings = "Not Available", stringsAsFactors = FALSE) #activity

act <- read.table("./data/UCI HAR Dataset/activity_labels.txt") # activities
act <- as.character(act[,2])


# Getting the variables' names
names <- read.table("./data/UCI HAR Dataset/features.txt") # variables' names
names <- names[,2]
names <- as.character(names)
names(data_test) <- names ; names(data_train) <- names

#Merges the training and the test sets to create one data set.
merged_data <- rbind(data_train,data_test)


#Extracts only the measurements on the mean and standard deviation for each measurement.
std <- grep("std()",names(merged_data ), fixed = TRUE)
mean <- grep("mean()", names(merged_data), fixed = TRUE)
collumns <- sort(c(mean,std))

selcted_data <- merged_data[,collumns]


#Uses descriptive activity names to name the activities in the data set
act_test <- as.character(act_test[,1])
act_train <- as.character(act_train[,1])

for (i in 1:6){ text <- as.character(i)
act_test<- sub(text , act[i], act_test )
act_train<-sub(text,act[i],act_train) 
}

activities <- c(act_train , act_test)
selcted_data$activities <- activities

#Appropriately labels the data set with descriptive variable names.
names(selcted_data) <- gsub("()","",names(selcted_data) ,fixed = TRUE)
names(selcted_data) <- gsub("^[t]","time",names(selcted_data))
names(selcted_data) <- gsub("^[f]","freq",names(selcted_data))
names(selcted_data) <- gsub("BodyGyro","AngularVelocity",names(selcted_data))
names(selcted_data) <- gsub("BodyAcc","LinearAcceleration",names(selcted_data))
names(selcted_data) <- gsub("Body","",names(selcted_data))

#names(selcted_data) <- gsub("tBodyAcc","timeAcceletation",names(selcted_data),fixed = TRUE)
#names(selcted_data) <- gsub("fBodyAcc","freqAcceletation",names(selcted_data),fixed = TRUE)



#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
mean <- c()
for (i in 1:6){data_1 <- selcted_data[selcted_data$activities==act[i],1:66]
x <- sapply(data_1, mean)
mean<- rbind(mean,x)
}
mean<- as.data.frame(mean)
mean$activities <- act
names(mean) <- names(selcted_data)

write.table(mean,file="Mean_data.txt", row.name = FALSE)
