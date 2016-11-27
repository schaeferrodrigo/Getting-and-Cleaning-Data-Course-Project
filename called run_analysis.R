if(!exists("./data")){dir.create(("./data"))} # creating a data folder

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url , destfile = "./data/data_set.zip")
data_version <- date()



library(utils)
unzip("./data/data_set.zip", exdir = "./data")

data_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt",na.strings = "Not Available", stringsAsFactors = FALSE) # data set - TEST
act_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt",na.strings = "Not Available", stringsAsFactors = FALSE) # activity

data_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt",na.strings = "Not Available", stringsAsFactors = FALSE) # data set -TRAIN
act_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt",na.strings = "Not Available", stringsAsFactors = FALSE) #activity

act <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
act <- as.character(act[,2])

#

names <- read.table("./data/UCI HAR Dataset/features.txt") # variables' names
names <- names[,2]
names <- as.character(names)

names(data_test) <- names ; names(data_train) <- names # changin the variables' of data sets

#

act_test <- as.character(act_test[,1])
act_train <- as.character(act_train[,1])

for (i in 1:6){ text <- as.character(i)
                act_test<- sub(text , act[i], act_test )
                act_train<-sub(text,act[i],act_train) 
              }

#data_train$activity <- act_train ; data_test$activity <-act_test 

activities <- c(act_train , act_test)
#

library(plyr)
merged_data <- merged_data <- rbind(data_train,data_test)

#



std <- grep("std()",names(merged_data ), fixed = TRUE)
mean <- grep("mean()", names(merged_data), fixed = TRUE)
collumns <- sort(c(mean,std))

selcted_data <- merged_data[,collumns]


selcted_data$activities <- activities 
#
names(selcted_data) <- gsub("()","",names(selcted_data) ,fixed = TRUE)
names(selcted_data) <- gsub("tBodyAcc","timeAcceletation",fixed = TRUE)
mean <- c()
for (i in 1:6){data_1 <- selcted_data[selcted_data$activities==act[i],1:66]
      x <- sapply(data_1, mean)
      mean<- rbind(mean,x)
}
mean<- as.data.frame(mean)

sd <- c()
for (i in 1:6){data_1 <- selcted_data[selcted_data$activities==act[i],1:66]
x <- sapply(data_1, sd)
sd<- rbind(sd,x)
}
